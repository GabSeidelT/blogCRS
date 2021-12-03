class CommentsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    layout 'admin'
    
        def index
            @comments = Comment.order(:created_at)
        end
    
        def new
            @comment = Comment.new
            get_params
        end
    
        def create
            @comment = Comment.new(comment_params)
            get_params
            @comment.user_id = current_user.id
        
            if @comment.save
            else
                render :new, status: :unprocessable_entity
            end
        end

        def destroy
            @comment = Comment.find(params[:id])
            
            if @comment.present?
                @comment.destroy 
            end
            redirect_to _path
        end
        
        private

        def get_params
            @users = User
        end

        def comment_params
            params.require(:comment).permit(:content, :user_id, :post_id)
        end
    
end
