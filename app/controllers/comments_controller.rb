class CommentsController < ApplicationController
  load_and_authorize_resource only: [ :create, :destroy ]
  before_action :set_post

def index
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user # или другой механизм определения пользователя

    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
