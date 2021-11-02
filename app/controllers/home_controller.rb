class HomeController < ApplicationController
  
  before_action :authenticate_user!, only: :index 

  def index
    @reservation = Reservation.includes(:hotel).where(user_id:current_user.id)
  end

  def index2
    @hotel = Hotel.where(user_id:current_user.id)
  end

  def profile
    @user = User.where(id:current_user.id)
  end

  def update
     @user= User.new(params.permit(:name, :profile, :avater ))
    if @user.save
      flash[:notice] = "更新しました"
      redirect_to action: :profile
    end
  end

end
