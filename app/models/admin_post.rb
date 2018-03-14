class AdminPost < ApplicationRecord
 belongs_to :admin_user, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
end
