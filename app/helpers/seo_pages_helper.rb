module SeoPagesHelper

  def remove_unnecessary_keywords(arg)
    return arg.gsub('�', ' ')  if arg.present?
  end  

  def historial_rates_report(postal_codes)
    main_hash = {}
    year_hash_30 = {}
    avg_rate_hash_30 = {}
    year_hash_15 = {}
    avg_rate_hash_15 = {}
    year_hash_10 = {}
    avg_rate_hash_10 = {}
    year_hash_7 = {}
    avg_rate_hash_7 = {}
    year_hash_5 = {}
    avg_rate_hash_5 = {}
    avg_credit_score_hash ={}
    avg_loan_to_value_hash ={}
    avg_combined_loan_to_value_hash ={}
    avg_debt_to_income_ration_hash ={}
    avg_first_time_home_buyer_hash ={}
    avg_mortgage_insurance_percentage_hash ={}
    @header_array =[]
    (Date.today.year-8..Date.today.year-1).each do |year|
      date = DateTime.new(year)
      year_start = date.beginning_of_year
      year_end = date.end_of_year

      #byebug
      complete_data = FreddieMacLoanOrigination.where(postal_code: postal_codes)
      complete_year_data = complete_data.where("first_payment_date >= ? and first_payment_date <= ? and loan_purpose = ?",  year_start, year_end, 'P')

      #complete_year_data= FreddieMacLoanOrigination.where("first_payment_date >= ? and first_payment_date <= ? and loan_purpose = ? and postal_code = ?",  year_start, year_end, 'P', state_code)
      complete_year_data_count = complete_year_data.count

      #header
      @header_array << year
      # for 30 year data
      yr_data_30 = complete_year_data.where(original_loan_term: 360)
      year_hash_30[year] = yr_data_30.count.to_f*100/complete_year_data_count
      avg_rate_hash_30[year] = yr_data_30.sum(:original_interest_rate).to_f/yr_data_30.count
      # for 15 year data
      yr_data_15 = complete_year_data.where(original_loan_term: 180)
      year_hash_15[year] = yr_data_15.count.to_f*100/complete_year_data_count
      avg_rate_hash_15[year] = yr_data_15.sum(:original_interest_rate).to_f/yr_data_15.count
      # for 10 year data
      yr_data_10 = complete_year_data.where(original_loan_term: 120)
      year_hash_10[year] = yr_data_10.count.to_f*100/complete_year_data_count
      avg_rate_hash_10[year] = yr_data_10.sum(:original_interest_rate).to_f/yr_data_10.count
      # for 7 year data
      yr_data_7 = complete_year_data.where(original_loan_term: 84)
      year_hash_7[year] = yr_data_7.count.to_f*100/complete_year_data_count
      avg_rate_hash_7[year] = yr_data_7.sum(:original_interest_rate).to_f/yr_data_7.count
      # for 5 year data
      yr_data_5 = complete_year_data.where(original_loan_term: 60)
      year_hash_5[year] = yr_data_5.count.to_f*100/complete_year_data_count
      avg_rate_hash_5[year] = yr_data_5.sum(:original_interest_rate).to_f/yr_data_5.count
      
      # for remaininig avg.s data
      avg_credit_score_hash[year] = complete_year_data.sum(:credit_score).to_f/complete_year_data_count
      avg_loan_to_value_hash[year] = complete_year_data.sum(:original_loan_to_value).to_f/complete_year_data_count
      avg_combined_loan_to_value_hash[year] = complete_year_data.sum(:original_combined_loan_to_value).to_f/complete_year_data_count
      avg_debt_to_income_ration_hash[year] = complete_year_data.sum(:original_debt_to_income_ratio).to_f/complete_year_data_count
      avg_first_time_home_buyer_hash[year] = complete_year_data.where(first_time_home_buyer_flag: 'Y').count/complete_year_data_count.to_f
      avg_mortgage_insurance_percentage_hash[year] = complete_year_data.sum(:mortgage_insurance_percentage).to_f/complete_year_data_count

      end
      main_hash['% 30 year fixed mortgage'] = year_hash_30
      main_hash['avg mortgage rate(30 yr)'] = avg_rate_hash_30
      main_hash['% 15 year fixed mortgage'] =  year_hash_15
      main_hash['avg mortgage rate(15 yr)'] =  avg_rate_hash_15
      main_hash['% 10/1 ARM'] =  year_hash_10
      main_hash['avg mortgage rate(10 yr)'] =  avg_rate_hash_10
      main_hash['% 7/1 ARM'] =  year_hash_7
      main_hash['avg mortgage rate(7 yr)'] =  avg_rate_hash_7
      main_hash['% 5/1 ARM'] =  year_hash_5
      main_hash['avg mortgage rate(5 yr)'] =  avg_rate_hash_5

      main_hash['Avg credit score'] = avg_credit_score_hash
      main_hash['Avg loan amount'] = avg_loan_to_value_hash
      main_hash['Avg LTV (loan to value)'] = avg_combined_loan_to_value_hash
      main_hash['Avg DTI (debt to income)'] = avg_debt_to_income_ration_hash
      main_hash['% First time homebuyer'] = avg_first_time_home_buyer_hash
      main_hash['Mortgage insurance percentage'] = avg_mortgage_insurance_percentage_hash

      return @header_array, main_hash
    end  

end
