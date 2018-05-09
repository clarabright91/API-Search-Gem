module SeoPagesHelper

  def remove_unnecessary_keywords(arg)
    return arg.gsub('�', ' ')  if arg.present?
  end  

end
