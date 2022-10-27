class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts[params[:id].to_i - 1]
    @post_idx = @user.posts.find_index(@post) + 1
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new

    render :new, locals: { post: @post }
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully!'
          redirect_to user_posts_path(@user)
        else
          flash[:error] = 'There was a problem creating the Post'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
