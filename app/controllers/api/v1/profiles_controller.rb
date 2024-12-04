class Api::V1::ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
  end
end
