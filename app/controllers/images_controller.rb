class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :show, :index]
  
  # GET /images
  def index
    @images = Image.all
  end

  # GET /images/1
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @album = Album.find(params[:album_id])
    @image = @album.images.build(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image.album, notice: 'Image was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /images/1
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /images/1
  def destroy
    @album = Album.find(params[:album_id])
    @image = @album.images.find(params[:id])
    @image.picture = nil
    @image.save
    @image.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Image was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    def admin_user
      redirect_to(root_url) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:album_id, :picture)
    end
end
