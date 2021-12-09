class UsersController < ApplicationController
    layout "admin"
    
    def index
        @users = User.all
    end

    def edit
        @roles = Role.order(:username)
        @user = User.find(params[:id])
    end
    
    def update
        @roles = Role.order(:username)
        @user = User.find(params[:id])
    
        if @user.update(user_params)
          redirect_to users_path
        else
          render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        
        if @user.present?
            @user.destroy 
        end
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :role_id)
    end

end

