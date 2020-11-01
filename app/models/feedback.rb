class Feedback
  # self.abstract_class = true
  include ActiveModel::Model

  attr_accessor :email, :body, :title

  validates :email,
            presence: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: I18n.t(".feedback.submit.correct_email") }
  validates :body, presence: true

end
