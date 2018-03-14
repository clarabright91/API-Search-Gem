class AdminUser < ApplicationRecord
 has_many :admin_post, foreign_key: :admin_user_id
accepts_nested_attributes_for :admin_post, :allow_destroy => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  #validates_presence_of :password
  #validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i        

end
