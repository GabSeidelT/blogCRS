class PostsController < ApplicationController

    def index
        @posts = Post.order(:name)
        @users = User.order(:email)
    end

    def new
        @post = Post.new
        @users = User.order(:email)
        @categories = Category.order(:name)
    end

    def create
        @post = Post.new(post_params)
    
        if @post.save
            if params[:category_ids].present?
                params[:category_ids].each do |id|
                    PostCat.create(post_id: @post.id, category_id: id)
                end
            end
            
            redirect_to posts_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post = Post.find(params[:id])
        @users = User.order(:email)
        @post_cats = @post.post_cats.select(:category_id)
        @categories = Category.order(:name)
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            if params[:category_ids].present?
                params[:category_ids].each do |id|
                    PostCat.create(post_id: @post.id, category_id: id)
                end
            end
            redirect_to posts_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        
        if @post.present?
            @post.destroy 
        end
        redirect_to posts_path
    end

    private
    def post_params
        params.require(:post).permit(:name, :summary, :content, :user_id, :image)
    end

end
