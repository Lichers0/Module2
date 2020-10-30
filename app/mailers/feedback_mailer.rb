class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def send_feedback(user, title, body)
    @user = user
    @title = title
    @body = body
    mail subject: t(".subject")
  end
end
