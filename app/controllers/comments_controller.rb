class CommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = user.posts[params[:post_id].to_i - 1]
    comment = Comment.new(comment_params)
    comment.author = current_user
    comment.post = post
    if comment.save
      flash[:success] = 'Comment created successfully!'
    else
      flash[:error] = 'There was a problem creating the comment'
    end
    redirect_to user_posts_path(user)
  end

  def new
    @comment = Comment.new
    @post = User.find(params[:user_id]).posts[params[:post_id].to_i - 1]
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
