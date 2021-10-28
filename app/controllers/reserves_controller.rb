class ReservesController < ApplicationController

  def new
    @reserve = Reserve.new(reserve_params)
  end

  def create
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
