class RatingsController < ApplicationController

    def  new
        @rating = Rating.new
    end
    
    def create
        @rating = Rating.new(rating_params)
        @rating.user_id = current_user.id

        if @rating.save
            respond_to do |format|
                format.js
            end
        end
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    def update
        @rating = Rating.find(params[:id])

        if @rating.update(rating_params)
        end
    end


    private

    def rating_params
        params.require(:rating).permit(:rate, :post_id)
    end
end
