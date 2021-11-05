class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  before_action :set_current_user
  before_action :set_search
  

  def set_search
    #@search = Article.search(params[:q])
    @search = Hotel.ransack(params[:q]) #ransackメソッド推奨
    @search_hotels = @search.result(distinct: true).order(created_at: "DESC").includes(:user)
    @search_hotels_count = @search.result(distinct: true).count
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :avatar]) 
    end

    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
end

