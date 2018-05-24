class LoanOfficer < ApplicationRecord
  #validates :first,:title,:company,:address,:city,:zip,:county,:phone1,:website,:email,:latitude,:longitude, presence: true

  #require 'fuzzy_match'

  def self.loan_officers_list(bank_name, term)    
    #LoanOfficer.fuzzy_search(company: bank_name, title: term).order("RANDOM()").first(5)
    LoanOfficer.fuzzy_search(company: bank_name, title: term).first(5)
  end

  def self.loan_officers_for_city(zip) 
   loan_officers =  where(zip: zip) 
   loan_officers = where("zip::text like ?", "#{zip.to_s.first(4).to_i}%")   unless loan_officers.present?
   loan_officers = where("zip::text like ?", "#{zip.to_s.first(3).to_i}%")   unless loan_officers.present?
   return  loan_officers.order("RANDOM()").first(10)
  end

end
