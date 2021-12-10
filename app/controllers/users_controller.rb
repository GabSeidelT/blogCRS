class UsersController < ApplicationController
    layout "admin"
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
        @roles = Role.order(:username)
    end

     def create
        @user = User.new(user_params)
        @roles = Role.order(:username)
    
        if @user.save
          redirect_to users_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
        @roles = Role.order(:username)
    end
    
    def update
        @user = User.find(params[:id])
        @roles = Role.order(:username)
    
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

