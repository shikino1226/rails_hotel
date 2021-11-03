class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  before_action :set_q
  before_action :set_current_user

  def search
    @results = @q.result
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) 
    end

    def set_q
      @q = Hotel.ransack(params[:q])
    end

    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
end

