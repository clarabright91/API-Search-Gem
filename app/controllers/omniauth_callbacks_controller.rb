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
     @user = from_omniauth(request.env["omniauth.auth"])
     sign_in(@user)
     redirect_to root_path, notice: 'Signed in successfully.'
   end

=begin
   Method:         from_omniauth
   Developer:      Varun
   Created:        01-03-2018
   Purpose:        Save data in users table form social site
   Params:         null
   Return:         boolean 
=end
  private
    def from_omniauth(auth)
          user = User.find_or_create_by(email: auth.info.email, name: auth.info.name)
          user.password = Devise.friendly_token[0,20]
          user.save
        return user
    end
end
