class Admin::CollectionsController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_collection, only: %i[edit update destroy]

  # GET /collections or /collections.json
  def index
  end

  def new
    @collection = Collection.new
  end

  def edit
    @collection = Collection.find(params[:id])
    puts "Editing Collection ID: #{params[:id]}"
  end

  def create
    @collection = current_user.collections.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to collection_path(@collection), notice: "Collection was successfully created." }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to collection_path(@collection), notice: "Collection was successfully updated." }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @collection.destroy!

    respond_to do |format|
      format.html { redirect_to collections_path, status: :see_other, notice: "Collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :body, post_ids: [])
  end
end
