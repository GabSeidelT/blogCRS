class HomeController < ApplicationController
    skip_before_action :authenticate_user!, :only => [:index]
    def index
        @posts = Post.order(:created_at)
        @categories = Category.order(:name)
    end
end
