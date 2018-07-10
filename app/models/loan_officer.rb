class LoanOfficer < ApplicationRecord
  #validates :first,:title,:company,:address,:city,:zip,:county,:phone1,:website,:email,:latitude,:longitude, presence: true

  #require 'fuzzy_match'

  def self.loan_officers_gen(bank, term)
    str= bank.name + term
    sum = 0
    str.each_char{|c| sum += c.ord}
    key = sum * 1000
    a_state_officers = LoanOfficer.where(state: ApplicationController.helpers.state_full_name(bank.stname, true))
    num_state_officers = a_state_officers.size
    return  []     if num_state_officers == 0
    
    loan_officers = []
    for i in 1..5
      index = (key * i) % num_state_officers
      loan_officers << a_state_officers[index]
    end
    return loan_officers
  end

  def self.loan_officers_for_city(city_obj) 
   #  zip = city_obj.zip 
   #  zip = '0' + zip.to_s      if  zip >= 1000 && zip <= 9999
   #  zip = '00' + zip.to_s     if zip.to_i >= 100 && zip.to_i <= 999
   #  loan_officers = where(city: city_obj.city, state: city_obj.state_code)
   #  loan_officers =  loan_officers.to_a + where(zip: zip)      if loan_officers.count < 10
   #  unless loan_officers.count > 10 
   #   loan_officers = loan_officers.to_a + where("zip::text like ?", "#{zip.to_s.first(4)}%")
   #  end
   #  unless loan_officers.count > 10
   #   loan_officers = loan_officers.to_a + where("zip::text like ?", "#{zip.to_s.first(3)}%")
   #  end
   # return loan_officers.uniq.first(10)
  

    zip = city_obj.zip    #12345
    zip_four_low   = zip.round(-1)      # 12340
    zip_four_high  = zip.round(-1) + 9  # 12349
    zip_three_low  = zip.round(-2)      # 12300
    zip_three_high = zip.round(-2) + 99 # 12399
    
    loan_officers = where(city: city_obj.city, state: city_obj.state_code)
    loan_officers =  loan_officers + where(zip: zip)      if loan_officers.count < 10
    unless loan_officers.count >= 10
     loan_officers = loan_officers + where("zip >= ? and zip <= ? ", zip_four_low,zip_four_high).limit(10)      # zip >= zip_four_low && zip <= zip_four_high LIMIT 10    
    end

    unless loan_officers.count >= 10
     loan_officers = loan_officers + where("zip >= ? and zip <= ? ", zip_three_low,zip_three_high).limit(10)    # zip >= zip_three_low && zip <= zip_three_high LIMIT 10   
    end
    return  loan_officers.uniq.first(10)   
  end

end
