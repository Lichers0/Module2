class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def send_feedback(feedback)
    @email = feedback.email
    @title = feedback.title
    @body = feedback.body
    mail subject: t(".subject")
  end
end
