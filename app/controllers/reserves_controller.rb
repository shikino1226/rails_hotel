class ReservesController < ApplicationController
  
  def index
  end

  def new
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

end
