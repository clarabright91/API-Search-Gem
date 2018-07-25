=begin
  Developer:      Varun
  Purpose:        for sharing common code section in fron end pages
=end
module PageHelper
  #function for removing white space tab nextline
  def remove_space(arg)
    return arg.delete(" \t\r\n")
  end

  #function for getting users location 
  def user_location_info
    if current_user.present? && current_user.current_sign_in_ip != "127.0.0.1"
      @user_info = Geocoder.search(current_user.current_sign_in_ip).first
    elsif request.remote_ip != "127.0.0.1"
      @user_info = Geocoder.search(request.remote_ip).first 
    # else         #static ip for unit testing 
    #   @user_info= Geocoder.search("213.180.204.26").first
    end   
    return @user_info
  end
end
