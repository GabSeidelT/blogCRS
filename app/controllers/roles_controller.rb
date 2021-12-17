class RolesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  layout 'admin'

    def index
        @roles = Role.order(:id)
    end

    def new
        @role = Role.new
    end

    def create
        @role = Role.new(role_params)
    
        if @role.save
          redirect_to roles_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @role = Role.find(params[:id])
        @users = User.order(:email)
    end

    def update
        @role = Role.find(params[:id])
        @users = User.order(:email)
    
        if @role.update(role_params)
          if params[:user_ids].present?
            @user.role_id = @role.id
          end
          redirect_to roles_path
        else
          render :edit, status: :unprocessable_entity
        end
    end
    
    private
    def role_params
        params.require(:role).permit(:username)
    end

end
