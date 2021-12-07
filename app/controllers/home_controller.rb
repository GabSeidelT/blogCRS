class HomeController < ApplicationController
    def index
        @posts = Post.order(:created_at)
        @categories = Category.order(:name)
    end

    def post
        @post = Post.find(params[:id])
        @user = User.find(params[:id])
        @comments = Comment.where(post_id: comment.post_id)
        @comment = Comment.new
    end
end
