class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! root_path, @user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user

    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User role updated."
    else
      redirect_to users_path, :alert => "Unable to update user role"
    end
  end

  def destroy
    authorize! :destroy, @user

    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end
