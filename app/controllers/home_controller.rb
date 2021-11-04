class HomeController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user!, only: :index 

  def index
    @reservation = Reservation.includes(:hotel).where(user_id:current_user.id)
  end

  def index2
    @hotel = Hotel.where(user_id:current_user.id)
  end

  def profile
    @user = User.find_by_id(current_user.id)
    # binding.pry
  end

  def update
    # binding.pry
    @user= User.find(params[:id])
    # binding.pry
    if @user.update(params.permit(:name, :avatar, :profile, :id))
      flash[:notice] = "更新しました"
      redirect_to action: :profile
    end
  end

  private

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end  
end
