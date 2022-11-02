class CommentsController < ApplicationController
  def new
    @comment = current_user.posts.first.comments.new
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)

    comment.author = current_user
    comment.post = post

    if comment.save
      flash[:success] = 'Comment successfully created'
      redirect_to user_post_path(user, post)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment was successfully deleted.'
      redirect_to user_posts_path
    else
      flash[:notice] = 'Something went wrong'
    end
  end

  private

  def comment_params
    params.require(:new_comment).permit(:text)
  end
end
