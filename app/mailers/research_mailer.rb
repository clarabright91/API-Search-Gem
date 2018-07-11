class ResearchMailer < ApplicationMailer
  def research_email(admin_user,name,email,website,research_summary,file_name,file)
    @name = name
    @email = email
    @website = website
    @research_summary = research_summary
    if file != ""
      attachments[file_name] = File.read(file)
    end
    mail(to: admin_user,subject: "Research From "+name)
  end
end
