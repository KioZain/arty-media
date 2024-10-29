class Admin::CommentsController < ApplicationController
    load_and_authorize_resource
    before_action :set_post
    before_action :set_post, only: %i[ edit destroy ]

    def index
      @comments = @post.comments
     end
end
