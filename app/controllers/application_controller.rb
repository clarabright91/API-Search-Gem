class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
# before_action :authenticate_user!
  protect_from_forgery prepend: true

  #script added for remaining fields
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:phone_number, :zip_code, :purpose, :home_price, :down_payment, :credit_score])
    end
end
