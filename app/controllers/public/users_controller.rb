class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
      flash[:notice] = "Customer was successfully updated."
      redirect_to users_mypage_path
   else
      render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name)
  end
end