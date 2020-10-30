class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def send_feedback(email, title, body)
    @email = email
    @title = title
    @body = body
    mail subject: t(".subject")
  end
end
