class BuysController < ApplicationController
  before_action :set_buy, only: [:show, :edit, :update, :destroy]

  # GET /buys
  # GET /buys.json
  def index
    @buys = Buy.all
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
    @buy.milk = @milk
    @buy.user = current_user
  end

  # GET /buys/new
  def new
    @buy = Buy.new
    @buy.user = current_user
    @buy.user != @milk.user.id
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(buy_params)
    @buy.user_id = current_user.id

    respond_to do |format|
      if @buy.save
        format.html { redirect_to @buy, notice: 'You have successfully bought the milk.' }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
    respond_to do |format|
      if @buy.update(buy_params)
        format.html { redirect_to @buy, notice: 'You have successfully updated' }
        format.json { render :show, status: :ok, location: @buy }
      else
        format.html { render :edit }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    if current_user.id == @buy.user.id
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url, notice: 'Your entry was successfully deleted.' }
      format.json { head :no_content }
    end
    else
    redirect_to root_path, notice: "You don't have permission."
    end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_params
      params.require(:buy).permit(:purchased_date, :price, :totalprice, :user_id, :milk_id)
    end
end
