class ResearchMailer < ApplicationMailer
  def research_email(admin_user,name,email,phone,message,file_name,file)
    @name = name
    @email = email
    @phone = phone
    @message = message
    if file != ""
      attachments[file_name] = File.read(file)
    end
    mail(to: admin_user,subject: "Research Query From "+name)
  end
end
