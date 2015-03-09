class UsersController < ApplicationController
   

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, :flash => { :notice => 'User was successfully Updated.' }
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, :flash => { :notice => 'User was successfully deleted.' }
  end

  private
  def user_params
    params.require(:user).permit(:email,:user_name,:password, :password_confirmation, :is_admin)
  end
end
