class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[ edit update destroy ]

  def new
  end


  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  # POST /posts or /posts.json
  def create
    # post_params.merge(post: { user_id: current_user.id })
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Пост успешно создан" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_path(@post), notice: "Пост успешно обновлён" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(
        :title, :body, :author, :post_image, :tag_list, :price, :city, :amount,
        displays_attributes: [ :id, :name, :year, :display_type, :link ]
      )
    end
end
