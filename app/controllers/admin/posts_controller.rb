class Admin::PostsController < ApplicationController
  load_and_authorize_resource
    # before_action :set_post, only: %i[ show edit update destroy ]

    # GET /posts or /posts.json
    def index
      if current_user
        @posts = Post.all
      end
  end
end
