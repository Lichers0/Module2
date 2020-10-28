class ApplicationMailer < ActionMailer::Base
  default from: %{"Test Guru" <noreply@testguru.com>}
  layout 'mailer'
end
