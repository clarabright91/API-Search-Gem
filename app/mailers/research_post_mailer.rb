class ResearchPostMailer < ApplicationMailer
  def research_post_email(admin_user,name,email,phone,research_summary,file_name,file, title)
    @name = name
    @email = email
    @phone = phone
    @research_summary = research_summary
    @title = title
    if file != ""
      attachments[file_name] = File.read(file)
    end
    mail(to: admin_user,subject: "Research post From "+name)
  end
end
