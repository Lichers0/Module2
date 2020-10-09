class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def destroy
    session.delete(:user_id)
    flash[:notification] = "Log out done."
    redirect_to login_path
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to tests_path
      redirect_to session[:auth_redirect] || root_path
    else
      flash[:alert] = "Verify your Email and Password please."
      redirect_to login_path
    end
  end

end