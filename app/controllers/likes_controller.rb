class LikesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = user.posts[params[:id].to_i - 1]
    like = Like.new
    like.author = current_user
    like.post = post
    if like.save
      flash[:success] = 'like created successfully!'
    else
      flash[:error] = 'There was a problem creating the like'
    end
    redirect_to user_posts_path(params[:user_id])
  end
end
