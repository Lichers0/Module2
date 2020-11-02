class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new
    @feedback.email = current_user.email if current_user
  end

  def submit
    @feedback = Feedback.new(feedback_params)
    if FeedbackService.new(@feedback).valid?
      redirect_to new_user_session_path, notice: t(".success")
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body, :email)
  end
end
