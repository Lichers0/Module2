class FeedbackMailer < ApplicationMailer
  def send_feedback(user_id, title, body)
    @user = User.find(user_id)
    @title = title
    @body = body
    admin_list = Admin.all.pluck(:email).join(',')
    mail to: admin_list, subject: t(".subject")
  end
end
