class ReservesController < ApplicationController

  def new
    @reserve = Reserve.new(reserve_params)
    @price = params[:price]
  end

  def create
    @reserve = Reserve.new(params.require(:reserve).permit(:check_in, :check_out, :people, :total_price, :hotel_id))
    if @reserve.save
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
  end

  private

  def reserve_params
    params.permit(:check_in, :check_out, :people, :hotel_id)
  end

end
