class ReservesController < ApplicationController

  def new
    @reserve = Reserve.new(reserve_params)
    @people = params[:people].to_i
    @price = params[:price].to_i
    @check_out = params[:check_out].to_date
    @check_in = params[:check_in].to_date
    @total_day = (@check_out - @check_in).to_i
    @total_price = @people * @price * @total_day
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
