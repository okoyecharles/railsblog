class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts[params[:id].to_i - 1]
    @post_idx = @user.posts.find_index(@post) + 1
  end
end
