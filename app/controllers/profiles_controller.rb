class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :show, :edit, :update, :destroy, :posts, :collections ]

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.includes(:user)
     @profile_post_counts = Post.group(:user_id).count
    @profile_collection_counts = Collection.group(:user_id).count
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    @user = @profile.user
    @posts = @user.posts
    @collections = @user.collections
    @profile = Profile.find(params[:id])
    @posts = @profile.user.posts
    @displays = Display.where(post_id: @posts.pluck(:id))
  end


  def posts
    @user = @profile.user
    @posts = @profile.user.posts
    render :show
  end

  def collections
    @user = @profile.user
    @collections = @profile.user.collections
    render :show
  end

  def displays
    @user = @profile.user
    @displays = Display.where(post_id: @posts.pluck(:id))
    render :show
  end


  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy!

    respond_to do |format|
      format.html { redirect_to profiles_path, status: :see_other, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :bio, :avatar, :placed, :contact)
    end
end
