class LoanOfficer < ApplicationRecord
  #validates :first,:title,:company,:address,:city,:zip,:county,:phone1,:website,:email,:latitude,:longitude, presence: true


  def self.loan_officers_list(state_code, bank, term)
    where('lower(title) like ? AND lower(city) like ? AND lower(state) like ? AND lower(company) = ?', "%#{term}%",bank.city.downcase, state_code.downcase, bank.name.downcase)
  end

end
