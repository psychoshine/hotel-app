class MainShotsController < ApplicationController
  before_action :set_main_shot, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :show]
  
  # GET /main_shots
  def index
    @main_shots = MainShot.all
  end

  # GET /main_shots/1
  def show
  end

  # GET /main_shots/new
  def new
    @main_shot = MainShot.new
  end

  # GET /main_shots/1/edit
  def edit
  end

  # POST /main_shots
  def create
    @main_shot = MainShot.new(main_shot_params)

    respond_to do |format|
      if @main_shot.save
        format.html { redirect_to root_path, notice: 'Main shot was successfully created.' }  
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /main_shots/1
  def update
    respond_to do |format|
      if @main_shot.update(main_shot_params)
        format.html { redirect_to @main_shot, notice: 'Main shot was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /main_shots/1
  def destroy
    @main_shot.photo = nil
    @main_shot.save
    @main_shot.destroy
    respond_to do |format|
      format.html { redirect_to main_shots_url, notice: 'Main shot was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_shot
      @main_shot = MainShot.find(params[:id])
    end
    def admin_user
      redirect_to(main_shots_path) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_shot_params
      params.require(:main_shot).permit(:title, :description, :photo, :title2, :description2)
    end
end
