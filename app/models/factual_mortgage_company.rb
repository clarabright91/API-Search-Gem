class FactualMortgageCompany < ApplicationRecord
  #validates :factual_id,:name,:address,:city,:state,:zip,:country,:latitude,:longitude,:phone, presence: true


  def self.loan_companies_for_city(city_obj)
    zip = city_obj.zip
    zip = '0' + zip.to_s    if  zip >= 1000 && zip <= 9999
    zip = '00' + zip.to_s   if zip >= 100 && zip <= 999
    loan_companies = where(city: city_obj.city, state: city_obj.state_code)
    loan_companies =  loan_companies.to_a + where(zip: zip)      if loan_companies.count < 10
    unless loan_companies.count > 10
     loan_companies = loan_companies.to_a + where("zip::text like ?", "#{zip.to_s.first(4).to_i}%")   
    end
    unless loan_companies.count > 10
     loan_companies = loan_companies.to_a + where("zip::text like ?", "#{zip.to_s.first(3).to_i}%")
    end
    return  loan_companies.uniq.first(10)
  end  

end
