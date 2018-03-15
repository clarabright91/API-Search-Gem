class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
# before_action :authenticate_user!
  
  #script added for remaining fields
  
  protect_from_forgery prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:phone_number, :zip_code, :purpose, :home_price, :down_payment, :credit_score])
  end

  # def after_sign_in_path_for(resource)
  #   request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  # end

end
