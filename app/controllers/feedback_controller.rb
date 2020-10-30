class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new
    @feedback.email = current_user.email if current_user
  end

  def submit
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbackMailer.send_feedback(params[:email], params[:title], params[:body]).deliver_now
      redirect_to root_path, notice: t(".success")
    else
      full_list = "<ul>"
      @feedback.errors.full_messages.each do |message|
        full_list += "\n<li>#{message}</li>"
      end
      full_list += "</ul>"
      flash[:alert] = full_list
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body, :email)
  end

end
