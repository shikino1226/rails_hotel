class ReservationsController < ApplicationController
  before_action :check, only: %i[ new ]
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
    @reservation = Reservation.new(reservation_require_params)
    # binding.pry
    if @reservation.save
      flash[:notice] = "予約をしました"
      redirect_to home_index_path
    else
      render "hotels"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to home_index_path
  end

  private

  def reservation_params
    params.permit(:check_in, :check_out, :people, :hotel_id, :user_id)
  end
  def reservation_require_params
    params.require(:reservation).permit(:check_in, :check_out, :people, :total_price, :hotel_id, :user_id)
  end
  def check
    @reservation = Reservation.new(reservation_params)
    if @reservation.check_in == "" || @reservation.check_out == "" || @reservation.people == ""
      redirect_to hotel_path(@reservation.hotel_id)
      flash[:notice] = "必須項目を入力してください"
    else
      @check_out = params[:check_out].to_date
      @check_in = params[:check_in].to_date
      @total_day = (@check_out - @check_in).to_i
      if @total_day < 0
        redirect_to hotel_path(@reservation.hotel_id)
        flash[:notice] = "終了日は開始日以降にしてください"
      elsif @reservation.people.to_i < 0
        redirect_to hotel_path(@reservation.hotel_id)
        flash[:notice] = "人数は１人以上にしてください"
      end
    end
  end
end
