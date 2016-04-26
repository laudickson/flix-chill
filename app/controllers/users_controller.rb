class UsersController < ApplicationController
  def index
    @users = User.order(:username)
  end

  def destroy
    @user = User.find(params['id'])
    @user.destroy
    flash[:notice] = "User was deleted"
    redirect_to users_path
  end
end
