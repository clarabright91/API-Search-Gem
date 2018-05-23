class FactualMortgageCompany < ApplicationRecord
  #validates :factual_id,:name,:address,:city,:state,:zip,:country,:latitude,:longitude,:phone, presence: true


  def self.loan_companies_for_city(zip)
   loan_companies =  where(zip: zip) 
   loan_companies = where("zip::text like ?", "#{zip.to_s.first(4).to_i}%")   unless loan_companies.present?
   loan_companies = where("zip::text like ?", "#{zip.to_s.first(3).to_i}%")   unless loan_companies.present?
   return  loan_companies.order("RANDOM()").first(10)
  end  

end
