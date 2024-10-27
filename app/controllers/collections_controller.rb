class CollectionsController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user&.admin?
      @collections = Collection.all
    elsif current_user
      @collections = current_user.collections
    else
      @collections = Collection.where(public: true)
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end
end
