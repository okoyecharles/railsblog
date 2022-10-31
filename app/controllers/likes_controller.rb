class LikesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    like = Like.new

    like.author = current_user
    like.post = post

    if like.save
      flash[:success] = 'Like created successfully'
    else
      flash[:error] = 'Something went wrong'
    end

    redirect_to user_post_path(user, post)
  end
end
