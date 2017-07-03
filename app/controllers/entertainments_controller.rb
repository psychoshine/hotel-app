class EntertainmentsController < ApplicationController
  before_action :set_entertainment, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
 
  # GET /entertainments
  def index
    @entertainments = Entertainment.all.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /entertainments/1
  def show
  end

  # GET /entertainments/new
  def new
    @entertainment = Entertainment.new
  end

  # GET /entertainments/1/edit
  def edit
  end

  # POST /entertainments
  def create
    @entertainment = Entertainment.new(entertainment_params)

    respond_to do |format|
      if @entertainment.save
        format.html { redirect_to entertainments_path, notice: 'Entertainment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /entertainments/1
  def update
    respond_to do |format|
      if @entertainment.update(entertainment_params)
        format.html { redirect_to @entertainment, notice: 'Entertainment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /entertaiments/1
  def destroy
    @entertainment.photo = nil
    @entertainment.save
    @entertainment.destroy
    respond_to do |format|
      format.html { redirect_to entertainments_url, notice: 'Entertainment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entertainment
      @entertainment = Entertainment.find(params[:id])
    end
    def admin_user
      redirect_to(entertainments_path) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entertainment_params
      params.require(:entertainment).permit(:title, :description, :black, :photo, :title2, :description2)
    end
end
