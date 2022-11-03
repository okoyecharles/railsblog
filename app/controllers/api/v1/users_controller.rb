class Api::V1::UsersController < ActionController::API
  def index
    # render json for users
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
