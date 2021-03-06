class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  helper_method :current_user
 
  private
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to root_path
    end
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
