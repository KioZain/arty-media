class Api::V1::ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @posts = @profile.user.posts
    @displays = Display.where(post_id: @posts.pluck(:id))
  end
end
