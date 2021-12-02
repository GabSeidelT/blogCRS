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
            @comment = Comment.new(category_params)
            get_params
            @comment.user_id = current_user.id
            @comment.post_id = @post.id
        
            if @comment.save
            else
                render :new, status: :unprocessable_entity
            end
        end
    
        def edit
            @comment = Comment.find(params[:id])
            get_params
        end
    
        def update
            @comment = Comment.find(params[:id])
            get_params
        
            if @comment.update(category_params)
                redirect_to home_post_path(id: @post.id)
            else
                render :edit, status: :unprocessable_entity
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
            @posts = Post.find(params[:id])
        end

        def comment_params
            params.require(:comment).permit(:content)
        end
    
end
