module SeoPagesHelper

  def remove_unnecessary_keywords(arg)
    return arg.gsub('�', ' ')  if arg.present?
  end  

  #Mortgage Rates
  def historial_rates_report(state_code)
    main_hash = {}
    (Date.today.year-8..Date.today.year-1).each do |year|
      date = DateTime.new(year)
      year_start = date.beginning_of_year
      year_end = date.end_of_year
      inner_data = {}
      complete_year_data= FreddieMacLoanOrigination.where("first_payment_date >= ? and first_payment_date <= ? and loan_purpose = ? and property_state = ?",  year_start, year_end, 'P', state_code)
      complete_year_data_count = complete_year_data.count
      # for 30 year data
      yr_data_30 = complete_year_data.where(original_loan_term: 360)
      inner_data['30yrs_data'] = yr_data_30.count.to_f*100/complete_year_data_count
      inner_data['avg_rate_30'] = yr_data_30.sum(:original_interest_rate).to_f/yr_data_30.count
      # for 15 year data
      yr_data_15 = complete_year_data.where(original_loan_term: 180)
      inner_data['15yrs_data'] = yr_data_15.count.to_f*100/complete_year_data_count
      inner_data['avg_rate_15'] = yr_data_15.sum(:original_interest_rate).to_f/yr_data_15.count
      # for 10 year data
      yr_data_10 = complete_year_data.where(original_loan_term: 120)
      inner_data['10yrs_data'] = yr_data_10.count.to_f*100/complete_year_data_count
      inner_data['avg_rate_10'] = yr_data_10.sum(:original_interest_rate).to_f/yr_data_10.count
      # for 7 year data
      yr_data_7 = complete_year_data.where(original_loan_term: 84)
      inner_data['7yrs_data'] = yr_data_7.count.to_f*100/complete_year_data_count
      inner_data['avg_rate_7'] = yr_data_7.sum(:original_interest_rate).to_f/yr_data_7.count
      # for 5 year data
      yr_data_5 = complete_year_data.where(original_loan_term: 60)
      inner_data['5yrs_data'] = yr_data_5.count.to_f*100/complete_year_data_count
      inner_data['avg_rate_5'] = yr_data_5.sum(:original_interest_rate).to_f/yr_data_5.count
      # for remaininig avg.s data
      inner_data['avg_credit_score'] = complete_year_data.sum(:credit_score).to_f/complete_year_data_count
      inner_data['avg_loan_to_value'] = complete_year_data.sum(:original_loan_to_value).to_f/complete_year_data_count
      inner_data['avg_combined_loan_to_value'] = complete_year_data.sum(:original_combined_loan_to_value).to_f/complete_year_data_count
      inner_data['avg_debt_to_income_ration'] = complete_year_data.sum(:original_debt_to_income_ratio).to_f/complete_year_data_count
      inner_data['avg_first_time_home_buyer'] = complete_year_data.where(first_time_home_buyer_flag: 'Y').count/complete_year_data_count.to_f
      inner_data['avg_mortgage_insurance_percentage'] = complete_year_data.sum(:mortgage_insurance_percentage).to_f/complete_year_data_count

      main_hash[year] = inner_data

     end 
     #byebug
     return main_hash
  end


end
