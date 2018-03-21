class ContactUsMailer < ApplicationMailer
 #Mailer for sending user's query to admin
  default from: "from@example.com"
  def contact_us_email(admin_user,query)
    @query= query
    mail(to: admin_user, subject: "Query From "+query[:name])
  end
end
