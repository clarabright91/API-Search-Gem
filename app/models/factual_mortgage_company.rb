class FactualMortgageCompany < ApplicationRecord
  #validates :factual_id,:name,:address,:city,:state,:zip,:country,:latitude,:longitude,:phone, presence: true


  def self.loan_companies_for_city(city_obj)
    # zip = city_obj.zip
    # zip = '0' + zip.to_s    if  zip >= 1000 && zip <= 9999
    # zip = '00' + zip.to_s   if zip.to_i >= 100 && zip.to_i <= 999
    # loan_companies = where(city: city_obj.city, state: city_obj.state_code)
    # loan_companies =  loan_companies.to_a + where(zip: zip)      if loan_companies.count < 10
    # unless loan_companies.count > 10
    #  loan_companies = loan_companies.to_a + where("zip::text like ?", "#{zip.to_s.first(4)}%")   
    # end
    # unless loan_companies.count > 10
    #  loan_companies = loan_companies.to_a + where("zip::text like ?", "#{zip.to_s.first(3)}%")
    # end
    # return  loan_companies.uniq.first(10)

    zip = city_obj.zip    #12345
    zip_four_low   = zip.round(-1)      # 12340
    zip_four_high  = zip.round(-1) + 9  # 12349
    zip_three_low  = zip.round(-2)      # 12300
    zip_three_high = zip.round(-2) + 99 # 12399
    
    loan_companies = where(city: city_obj.city, state: city_obj.state_code)
    loan_companies =  loan_companies + where(zip: zip)      if loan_companies.count < 10
    unless loan_companies.count >= 10
     loan_companies = loan_companies + where("zip >= ? and zip <= ? ", zip_four_low,zip_four_high).limit(10)      # zip >= zip_four_low && zip <= zip_four_high LIMIT 10    
    end

    unless loan_companies.count >= 10
     loan_companies = loan_companies + where("zip >= ? and zip <= ? ", zip_three_low,zip_three_high).limit(10)    # zip >= zip_three_low && zip <= zip_three_high LIMIT 10   
    end

    return  loan_companies.uniq.first(10) 

  end  

end
