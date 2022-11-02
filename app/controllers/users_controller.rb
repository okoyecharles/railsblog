class UsersController < ApplicationController
  def index
    @current_user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
