class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_app
  # before_action :authenticate_user!
  protect_from_forgery prepend: true

  #script added for permitting fields in user table
  before_action :configure_permitted_parameters, if: :devise_controller?

  #http_basic_authenticate_with :name => "admin", :password => "pureloan123"
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :zip_code, :purpose, :home_price, :down_payment, :credit_score, :last_search_id, :price_alert, :is_active])
  end
  def authenticate_app
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == 'admin' && md5_of_password == '8092dc9b1315b0134b1346b71a9196f5'
    end
  end
end
