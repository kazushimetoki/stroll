class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
    
  def index
    @users = User.page(params[:page])
  end
    
    
  def show
    @users = User.find(params[:id]) 
  end
    
    
  def edit
    @users = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)  
  end
  
  def destroy
    user = User.find(params[:id])
    user.delete()
    redirect_to admin_users_path
  end

end
