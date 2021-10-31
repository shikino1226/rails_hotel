class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new(reservation_params)
    @people = params[:people].to_i
    @price = params[:price].to_i
    @check_out = params[:check_out].to_date
    @check_in = params[:check_in].to_date
    @total_day = (@check_out - @check_in).to_i
    @total_price = @people * @price * @total_day
    # binding.pry
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :people, :total_price, :hotel_id, :user_id))
    # binding.pry
    if @reservation.save
      flash[:notice] = "予約をしました"
      redirect_to :hotels
    else
      render "hotels"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to :hotels
  end

  private

  def reservation_params
    params.permit(:check_in, :check_out, :people, :hotel_id, :user_id)
  end

end
