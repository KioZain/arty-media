class CollectionsController < ApplicationController
  load_and_authorize_resource
  def index
    if current_user
      @collections = current_user.collections

    elsif current_user && current_user.admin?
      @collection = Collection.all

    else
      @collections = Collection.where(public: true)
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end
end
