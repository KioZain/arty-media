class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all
    # render json: @posts
    render json: @posts.as_json
  end
end
