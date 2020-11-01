class FeedbackService
  def initialize(feedback)
    @feedback = feedback
  end

  def valid?
    if @feedback.valid?
      FeedbackMailer.send_feedback(@feedback).deliver_now
    else
      create_error_list
    end
  end

  private

  def create_error_list
    full_list = "<ul>"
    @feedback.errors.full_messages.each do |message|
      full_list += "\n<li>#{message}</li>"
    end
    full_list += "</ul>"
    flash[:alert] = full_list
  end
end