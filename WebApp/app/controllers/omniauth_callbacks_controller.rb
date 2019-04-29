class OmniauthCallbacksController < Devise::OmniauthCallbacksController
=begin
Method:         facebook
Developer:      Varun
Created:        01-03-2018
Purpose:        User login with facebook
Params:         User facebook login details
Return:         facebook hash []
=end
 def facebook
   @user = from_omniauth(request.env["omniauth.auth"], "facebook")
   sign_in(@user)
   redirect_to root_path, notice: 'Signed in successfully.'
 end

 def google_oauth2
    @user = from_omniauth(request.env['omniauth.auth'], "gmail")
    sign_in(@user)
    redirect_to root_path, notice: 'Signed in successfully.'
 end

private
  def from_omniauth(auth, social)
    user_name = auth.info.name.split(' ') 
    first_name = user_name[0].present? ? user_name[0] : ''
    last_name = user_name[1].present? ? user_name[1] : ''
    user = User.find_by(email: auth.info.email)
    return user     if user
    user = User.create(email: auth.info.email, first_name: first_name, last_name: last_name, social_login: social)
    user.password = Devise.friendly_token[0,20]
    user.save
    return user
  end

  # def from_google_auth(auth)
  #   first_name = auth.info.first_name.present? ? auth.info.first_name : ''
  #   last_name = auth.info.last_name.present? ? auth.info.last_name : ''
  #   user = User.find_or_create_by(email: auth.info.email, first_name: first_name, last_name: last_name)
  #   user.password = Devise.friendly_token[0,20]
  #   user.save
  #   return user
  # end

end
