class ApplicationMailer < ActionMailer::Base
  default from: %{"Test Guru" #{Settings.email}}
  layout 'mailer'
end
