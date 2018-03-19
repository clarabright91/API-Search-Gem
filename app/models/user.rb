class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]    #for facebook

  validates :first_name, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates :phone_number, presence: {message: 'Enter valid Mobile Number'},
                      #numericality: true,
                      #length: { minimum: 10, maximum: 15 }
  #validates :zip_code, presence: {message: 'Enter valid Zip Code'},
                      #numericality: true,
                      #length: { minimum: 6, maximum: 10 }
  #validates :home_price, :down_payment, :credit_score,
                     #numericality: true,
                     #length: { minimum: 2, maximum: 15 }
  #validates_presence_of :purpose

  def active_for_authentication?    #for checking user is active
    super && self.is_active
  end

  def inactive_message              #model level message for deactivated user
    "Sorry, this account has been deactivated."
  end
end
