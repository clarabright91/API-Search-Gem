class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]    #for facebook

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

  # association with mortgage_search_results module
  has_many :mortgage_search_results, dependent: :destroy
  #association with loan_tek_data
  has_many :user_favorites, dependent: :destroy
  #needs to be done
  #has_many :loan_tek_data, through: :user_favorites

  after_create :insert_default_data

  def active_for_authentication?    #for checking user is active
    super && self.is_active
  end

  def inactive_message              #model level message for deactivated user
    "Sorry, this account has been deactivated."
  end

  def insert_default_data
     self.update_attributes!(price_alert: 1)   unless price_alert.present?
  end
end
