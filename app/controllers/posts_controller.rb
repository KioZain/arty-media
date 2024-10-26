class PostsController < ApplicationController
  def index
    if current_user
      @posts = current_user.posts

    elsif current_user && current_user.admin?
      @post = Post.all

    else
      @posts = Post.where(public: true)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
