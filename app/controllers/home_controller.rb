class HomeController < ApplicationController
    def index
        @posts = Post.order(:created_at)
        @categories = Category.order(:name)
    end

    def post
        @post = Post.find(params[:id])

        @rating = Rating.new
        @ratings = Rating.order(created_at: :desc)
        @average = Rating.where(post_id: @post.id).average('rate')
        
        @comment = Comment.new
        @comment_son = Comment.new
        @comments = Comment.where(post_id: @post.id).where(comment_id: nil).order(created_at: :desc)
    end
end
