class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /albums
  def index
    @albums = Album.all.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /albums/1
  def show
    @images = @album.images.order(created_at: :desc)
    @image = @album.images.build
    @images = @album.images
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /albums/1
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /albums/1
  def destroy
    @album.cover = nil
    @album.save
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end
    def admin_user
      redirect_to(albums_path) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :description, :cover, :black, :title2, :description2)
    end
end
