class PostsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!, :except => [:show]
    layout 'admin', except: :show

    def index
        @posts = Post.select('posts.id, posts.name, posts.summary, posts.created_at, AVG(ratings.rate) as media')
        .joins("LEFT JOIN ratings ON ratings.post_id = posts.id")
        .group("posts.id")
        .order(created_at: :desc)        
        @users = User.order(:email)
    end

    def new
        @post = Post.new
        get_params
        
    end

    def create
        @post = Post.new(post_params)
        get_params
        @post.user_id = current_user.id
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
        get_params
    end

    def update
        @post = Post.find(params[:id])
        get_params
        
        if @post.update(post_params)
            @post_cats_delete = PostCat.where(post_id: @post.id).where('category_id NOT IN (:category_ids)', category_ids: params[:category_ids])
            @post_cats_delete.delete_all

            if params[:category_ids].present?
                params[:category_ids].each do |id|
                    post_cat = PostCat.where(post_id: @post.id, category_id: id)
                    if post_cat.blank?
                        PostCat.create(post_id: @post.id, category_id: id)
                    end
                end
            else
                @post.post_cats.destroy_all
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
    def get_params
        @users = User.order(:email)
        @post_cats = @post.post_cats.select(:category_id)
        @categories = Category.order(:name)
    end

    def post_params
        params.require(:post).permit(:name, :summary, :content, :user_id, :image)
    end

end
