class PostsController < ApplicationController
    load_and_authorize_resource

 def index
    if current_user&.admin?
      @posts = Post.all
    elsif current_user
      @posts = current_user.posts
    else
      @posts = Post.where(public: true)
    end
  end


  def by_tag
    @posts = Post.tagged_with(params[:tags])
    render :index
  end

  def show
    @post = Post.find(params[:id])
  end
end
