=begin
  Developer:      Varun
  Purpose:        for showing custom messages 
=end
module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      sentence = I18n.t('errors.messages.custom_error')

      #For showing bootstrap error messages
      html = <<-HTML
      <div class="col-md-offset-3 col-md-6 alert alert-danger" style="height: 5%;">
        <button type="button" class="close" data-dismiss="alert">x</button>
        #{messages}
      </div>
      HTML
    html.html_safe
  end
end
