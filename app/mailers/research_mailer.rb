class ResearchMailer < ApplicationMailer
  def research_email(admin_user,name,email,website,message,file_name,file)
    @name = name
    @email = email
    @website = website
    @message = message
    if file != ""
      attachments[file_name] = File.read(file)
    end
    mail(to: admin_user,subject: "Research Share From "+name)
  end
end
