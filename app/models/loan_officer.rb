class LoanOfficer < ApplicationRecord
  #validates :first,:title,:company,:address,:city,:zip,:county,:phone1,:website,:email,:latitude,:longitude, presence: true

  #require 'fuzzy_match'

  def self.loan_officers_list(bank_name, term, state_code)    
    #LoanOfficer.fuzzy_search(company: bank_name, title: term).first(5)
    if term == 'auto'
      officers =  LoanOfficer.fuzzy_search(company: bank_name, state: state_code )[10..14]
      officers = LoanOfficer.fuzzy_search(company: bank_name)[10..14]     unless officers.present? 
    elsif term == 'personal'
      officers = LoanOfficer.fuzzy_search(company: bank_name, title: term ).first(5)
        if officers.present? 
          if officers.count < 5
            off_data = LoanOfficer.fuzzy_search(company: bank_name, state: state_code)[5..9]
            if off_data.present?
              officers = officers +  off_data          
            else
              off_data_state = LoanOfficer.fuzzy_search(company: bank_name)[5..9]
              officers = officers + off_data_state      if off_data_state.present?
            end  
          end
        else 
          officers = LoanOfficer.fuzzy_search(company: bank_name, state: state_code)[5..9]
          officers = LoanOfficer.fuzzy_search(company: bank_name)[5..9]    unless officers.present?
        end
    else
      officers = LoanOfficer.fuzzy_search(company: bank_name, title: term ).first(5)
        if officers.present?
          if  officers.count < 5 
            off_data = LoanOfficer.fuzzy_search(company: bank_name, state: state_code).first(5)
            if  off_data.present? 
              officers = officers + off_data  
            else 
              off_data_state = LoanOfficer.fuzzy_search(company: bank_name).first(5)
              officers = officers + off_data_state      if off_data_state.present?
            end 
          end
        else
          officers = LoanOfficer.fuzzy_search(company: bank_name, state: state_code).first(5)
          officers = LoanOfficer.fuzzy_search(company: bank_name)[0..4]    unless officers.present?
        end   
    end
    return officers.uniq.first(5)     if officers.present?
  end


  def self.loan_officers_for_city(city_obj) 
    zip = city_obj.zip 
    loan_officers = where(city: city_obj.city, state: city_obj.state_code)
    loan_officers =  loan_officers.to_a + where(zip: zip)      if loan_officers.count < 10
    unless loan_officers.count > 10 
     loan_officers = loan_officers.to_a + where("zip::text like ?", "#{zip.to_s.first(4).to_i}%")
    end
    unless loan_officers.count > 10
     loan_officers = loan_officers.to_a + where("zip::text like ?", "#{zip.to_s.first(3).to_i}%")
    end
   return loan_officers.uniq.first(10)
  end

end
