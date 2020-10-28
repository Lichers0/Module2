class FeedbackController < ApplicationController
  def new; end

  def submit
    FeedbackMailer.send_feedback(current_user.id, params[:title], params[:body])
    redirect_to root_path, notice: t(".success")
  end
end
