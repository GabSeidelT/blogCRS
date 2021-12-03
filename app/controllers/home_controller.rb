class HomeController < ApplicationController
    def index
        @posts = Post.order(:created_at)
        @categories = Category.order(:name)
    end

    def post
        @post = Post.find(params[:id])
        @comments = Comment.order(:created_at).where(:post_id == @post.id)
        @comment = Comment.new
    end
end
