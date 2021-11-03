class HomeController < ApplicationController
  
  before_action :authenticate_user!, only: :index 

  def index
    @reservation = Reservation.includes(:hotel).where(user_id:current_user.id)
  end

  def index2
    @hotel = Hotel.where(user_id:current_user.id)
  end

  def profile
    @user = User.find_by(id: session[:user_id])  
    # binding.pry
  end

  def update
    # binding.pry
    @user= User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :avater, :profile))
      flash[:notice] = "更新しました"
      redirect_to action: :profile
    end
  end

end
