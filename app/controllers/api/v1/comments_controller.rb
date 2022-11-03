class Api::V1::CommentsController < ActionController::API
  before_action :set_comment, only: %i[show]
  def index
    @post = Post.find(params[:post_id])
    comments = @post.comments
    render json: comments
  end

  def show
    render json: @comment
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
