class FactualMortgageCompany < ApplicationRecord
  #validates :factual_id,:name,:address,:city,:state,:zip,:country,:latitude,:longitude,:phone, presence: true


  def self.loan_companies_for_city(zip)
    loan_companies =  where(zip: zip*100) 
    unless loan_companies.count > 10
     loan_companies += where("zip::text like ?", "#{zip.to_s.first(4).to_i}%")   
    end
  
    unless loan_companies.count > 10
     loan_companies += where("zip::text like ?", "#{zip.to_s.first(3).to_i}%")
    end
    return  loan_companies.first(10)
  end  

end
