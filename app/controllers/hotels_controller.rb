class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy ]
  before_action :set_current_user

  # GET /hotels or /hotels.json
  def home
    
  end

  def index
    @hotels = Hotel.all
    @reservations = Reservation.all
  end

  # GET /hotels/1 or /hotels/1.json
  def show
    @reservation = Reservation.new
    @hotel_user_id = @hotel.user_id
    @user_avatar = User.find(@hotel_user_id)
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels or /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)
# binding.pry
    respond_to do |format|
      if @hotel.save
        format.html { redirect_to home_index2_path, notice: "ルーム登録しました." }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1 or /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: "ルーム内容を更新しました." }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to home_index2_path, notice: "ルームを削除しました" }
      format.json { head :no_content }
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :introduction, :price, :address, :picture, :user_id)
    end
end

def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end

