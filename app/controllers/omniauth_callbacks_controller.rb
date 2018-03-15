class OmniauthCallbacksController < Devise::OmniauthCallbacksController
   def facebook
     @user = from_omniauth(request.env["omniauth.auth"])
     sign_in(@user)
     redirect_to root_path, notice: 'Signed in successfully.'
  end


  private

  def from_omniauth(auth)
        user = User.find_or_create_by(email: auth.info.email, name: auth.info.name)
        user.password = Devise.friendly_token[0,20]
        user.save
      return user
  end 
end