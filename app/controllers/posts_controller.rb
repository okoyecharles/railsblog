class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      @post.update_posts_counter
      flash[:success] = 'Post was successfully deleted.'
    else
      flash[:notice] = 'Something went wrong'
    end
    redirect_to user_posts_path
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @like = Like.new
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
