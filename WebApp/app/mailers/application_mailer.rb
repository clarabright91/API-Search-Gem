class ApplicationMailer < ActionMailer::Base
  #default from: 'hello@pureloan.com'
  default sender: 'hello@pureloan.com'
  layout 'mailer'
end
