class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      session[:auth_redirect] = request.path
      redirect_to login_path, alert: "Need to login."
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
