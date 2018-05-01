class FdicSecurity < ApplicationRecord

  def self.mortgage_security_details(bank_name, city)
    find_by(name: bank_name, city: city)
  end
  
end
