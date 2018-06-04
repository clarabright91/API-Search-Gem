module SeoPagesHelper

  def remove_unnecessary_keywords(arg)
    return arg.gsub('�', ' ')  if arg.present?
  end  

  #for removing special chars & formatting contact numbers
  def mobile_no_formatting(arg)
    if arg.present?                               
      if arg.downcase.include?('toll') || arg.downcase.include?('phone') || arg.downcase.include?('direct') || arg.downcase.include?('office')
        return number_to_phone(arg.gsub(/[^\d,\.]/, '').to_i, area_code: true)
      elsif arg.downcase.include?('ext')
        phone_number = arg.downcase.split('ext')
        phone = if phone_number[0].to_i == 0 || phone_number[0].to_i.to_s.size < 10
          number_to_phone(phone_number[0].gsub!(/[^0-9A-Za-z]/, '').to_i, area_code: true)
        else
         number_to_phone(phone_number[0].to_i, area_code: true)
        end
       return phone.to_s + ' Ext'+ remove_unnecessary_keywords(phone_number[1])
      elsif arg.include?('(') || arg.include?(')') || arg.include?('-') || arg.include?('.') || arg.include?(' ')
       return  number_to_phone(arg.gsub!(/[^0-9A-Za-z]/, '').to_i, area_code: true)    
      else
        return number_to_phone(arg.to_i, area_code: true) 
      end
    end

  end

  def asset_and_dep_formatting(val)
    if val.present?
      return val.gsub(',', '').to_i
    else 
      return 0
    end
  end

  #dynamic report starts from here for both mortgage and refinance
  def historial_rates_report(postal_codes, loan_purpose)
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
    first_average_for_the_location = {}
    second_average_for_the_location = {}  
    average_for_the_location = {}
    @header_array =[]
    #curent date for fetching required years & dates
    current_date = DateTime.now 
    start_year = current_date - 8.year
    end_year = current_date - 1.year
    #fetching all records for an city on the basis of all zip codes
    #if loan_purpose == 'P'
    complete_data =   FreddieMacLoanOrigination.where(postal_code: postal_codes, loan_purpose: loan_purpose).where("first_payment_date >= ? and first_payment_date <= ?", start_year.beginning_of_year, end_year.end_of_year)
    # else 
    #   FreddieMacLoanOrigination.where(postal_code: postal_codes).where.not(loan_purpose: 'P').where("first_payment_date >= ? and first_payment_date <= ?", start_year.beginning_of_year, end_year.end_of_year)
    # end 
      (current_date.year-8..current_date.year-1).each do |year|
        date = DateTime.new(year)
        year_start = date.beginning_of_year
        year_end = date.end_of_year
        complete_year_data = complete_data.where("first_payment_date >= ? and first_payment_date <= ?", year_start, year_end)
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
        #for mortgage report 
          if loan_purpose == 'P'
            avg_first_time_home_buyer_hash[year] = complete_year_data.where(first_time_home_buyer_flag: 'Y').count/complete_year_data_count.to_f
            avg_mortgage_insurance_percentage_hash[year] = complete_year_data.sum(:mortgage_insurance_percentage).to_f/complete_year_data_count
          else
        #for refinance report   
            purpose_c = complete_year_data.where(loan_purpose: 'C').count
            purpose_n = complete_year_data.where(loan_purpose: 'N').count
            n_c_total = purpose_c + purpose_n
            first_average_for_the_location[year] =  purpose_c.to_f/n_c_total
            second_average_for_the_location[year] = purpose_n.to_f/n_c_total  
            average_for_the_location[year] = complete_year_data.sum(:mortgage_insurance_percentage).to_f/complete_year_data_count
          end 
      end
      #final hash of hashes for displaying data
        #common code section
        main_hash['% 30 year fixed mortgage'] = year_hash_30
        main_hash['avg rate(30 yr)'] = avg_rate_hash_30
        main_hash['% 15 year fixed mortgage'] =  year_hash_15
        main_hash['avg rate(15 yr)'] =  avg_rate_hash_15
        main_hash['% 10/1 ARM'] =  year_hash_10
        main_hash['avg rate(10 yr)'] =  avg_rate_hash_10
        main_hash['% 7/1 ARM'] =  year_hash_7
        main_hash['avg rate(7 yr)'] =  avg_rate_hash_7
        main_hash['% 5/1 ARM'] =  year_hash_5
        main_hash['avg rate(5 yr)'] =  avg_rate_hash_5
        main_hash['Avg credit score'] = avg_credit_score_hash
        main_hash['Avg LTV (loan to value'] = avg_loan_to_value_hash
        main_hash['Avg Combined LTV (loan to value)'] = avg_combined_loan_to_value_hash
        main_hash['Avg DTI (debt to income)'] = avg_debt_to_income_ration_hash
        #Special sections on the basis of loan type
        if loan_purpose == 'P'
          main_hash['% First time homebuyer'] = avg_first_time_home_buyer_hash
          main_hash['Mortgage insurance percentage'] = avg_mortgage_insurance_percentage_hash
        else 
          main_hash['% Cash-out refinance'] = first_average_for_the_location
          main_hash['% No cash-out refinance'] = second_average_for_the_location
          main_hash['Avg mortgage insurance %'] =  average_for_the_location 
        end 
      return @header_array, main_hash
  end  

end
