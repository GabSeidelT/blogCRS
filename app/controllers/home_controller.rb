class HomeController < ApplicationController
    def index
        @posts = Post.order(:created_at)
        @categories = Category.order(:name)
    end

    def post
        @post = Post.find(params[:id])
        @comment = Comment.order(:created_at)
    end
end
