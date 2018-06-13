module SeoPagesHelper

  def remove_unnecessary_keywords(arg)
    return arg.gsub('�', ' ')  if arg.present?
  end  

  #for removing special chars & formatting contact numbers
  def mobile_no_formatting(arg)
    if arg.present?                               
      if arg.downcase.include?('toll') || arg.downcase.include?('phone') || arg.downcase.include?('direct') || arg.downcase.include?('office')
        return number_to_phone(arg.gsub(/[^\d,\.]/, '').to_i, area_code: true)
      elsif arg.downcase.include?('ext')
        phone_number = arg.downcase.split('ext')
        phone = if phone_number[0].to_i == 0 || phone_number[0].to_i.to_s.size < 10
          number_to_phone(phone_number[0].gsub!(/[^0-9A-Za-z]/, '').to_i, area_code: true)
        else
         number_to_phone(phone_number[0].to_i, area_code: true)
        end
       return phone.to_s + ' Ext'+ remove_unnecessary_keywords(phone_number[1])
      elsif arg.include?('(') || arg.include?(')') || arg.include?('-') || arg.include?('.') || arg.include?(' ')
       return  number_to_phone(arg.gsub!(/[^0-9A-Za-z]/, '').to_i, area_code: true)    
      else
        return number_to_phone(arg.to_i, area_code: true) 
      end
    end

  end

  def asset_and_dep_formatting(val)
    if val.present?
      return val.gsub(',', '').to_i
    else 
      return 0
    end
  end

end
