class HomeController < ApplicationController
  
  before_action :authenticate_user!, only: :index 

  def index
    @reservation = Reservation.includes(:hotel).where(user_id:current_user.id)
  end

  def index2
    @hotel = Hotel.where(user_id:current_user.id)
  end

  def profile
  end

end
