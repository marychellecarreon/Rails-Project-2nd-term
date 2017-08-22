class MilksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_milk, only: [:show, :edit, :update, :destroy]

  # GET /milks
  # GET /milks.json
  def index
    
    
    if params[:search].present?
    @milks = Milk.near(params[:search], 50)
  else
    @milks = Milk.all
  end
end


  def show
    @buy = Buy.new
    @reviews = @milk.reviews
    @average_review = if @reviews.blank?
      0
    else
      @milk.reviews.average(:rating)
  end
end

  # GET /milks/new
  def new
    @milk = current_user.milks.build
  end

  # GET /milks/1/edit
  def edit
    if current_user.id != @milk.user.id
    redirect_to root_path, notice: "You don't have permission."
    end
  end
  
  def update
    respond_to do |format|
      if @milk.update(milk_params)
        format.html { redirect_to @milk, notice: 'Your entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @milk }
      else
        format.html { render :edit }
        format.json { render json: @milk.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /milks
  # POST /milks.json
  def create
     @milk = Milk.new(milk_params)
     @milk.user_id = current_user.id if current_user
    respond_to do |format|
      if @milk.save
        format.html { redirect_to @milk, notice: 'Your entry was successfully created.' }
        format.json { render :show, status: :created, location: @milk }
      else
        format.html { render :new }
        format.json { render json: @milk.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.id == @milk.user_id
     @milk.destroy
      respond_to do |format|
      format.html { redirect_to milks_url, notice: 'Your entry was successfully destroyed.' }
      format.json { head :no_content }
    end
   else
   redirect_to root_path, notice: "You don't have permission."
 end
 end
 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milk
      @milk = Milk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milk_params
      params.require(:milk).permit(:price, :owner, :country, :city, :avatar, :reviews)
    end
end
