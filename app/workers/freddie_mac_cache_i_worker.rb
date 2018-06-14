class FreddieMacCacheIWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 2

  def perform(states)  
    City.where(state_code: states).each do |c|
      zip_code = c.zip
      alreday_exist = FreddieMacCache.where('zip_prefix = ? OR zip_prefix = ?', zip_code.to_s.first(3)+'00', zip_code.to_s.first(2)+'000')
      # for mortgage
      unless alreday_exist.find_by(loan_type: 'P', cached_year: Date.today.year).present?
        mortgage_result, zip_prefix_p = common_report_section(zip_code, 'P')
          freedie_cache_data(mortgage_result.to_json, 'P', zip_prefix_p)  
      end
      # for refinance Non-cash out
      unless alreday_exist.find_by(loan_type: 'N', cached_year:  Date.today.year).present?
        n_refinance_result, zip_prefix_n  = common_report_section(zip_code, 'N')
          freedie_cache_data(n_refinance_result.to_json, 'N', zip_prefix_n)
      end
      # for refinance Cash out   
      unless alreday_exist.find_by(loan_type: 'C', cached_year:  Date.today.year).present?
        c_refinance_result, zip_prefix_c = common_report_section(zip_code, 'C')
          freedie_cache_data(c_refinance_result.to_json, 'C', zip_prefix_c)         
      end
    end 
    #p "worker i "
  end  
  
  def freedie_cache_data(main_hash, loan_type, zip_prefix)
    begin
      #ActiveRecord::Base.connection_pool.with_connection do
       data = JSON.parse(main_hash)
        fmcd = FreddieMacCache.find_or_create_by(zip_prefix: zip_prefix, loan_type: loan_type)
          fmcd.cached_year = Date.today.year
          fmcd.freddie_data = data
          fmcd.save!
      #end     
    rescue => e
      p e.message
     # ensure
     #   GC.start
    end
  end  

  #dynamic report starts from here for both mortgage and refinance
  def common_report_section(zip, loan_purpose)
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
    #curent date for fetching required years & dates
    current_date = DateTime.now 
    start_year = current_date - 8.year
    end_year = current_date - 1.year
    
    #fetching all records for an city on the basis of all zip codes
    complete_data =  FreddieMacLoanOrigination.where("postal_code::text like ? and  loan_purpose = ?","#{zip.to_s.first(3).to_i}%", loan_purpose).where("first_payment_date >= ? and first_payment_date <= ?", start_year.beginning_of_year, end_year.end_of_year)  
        zip_prefix = zip.to_s.first(3) + '00'

    unless complete_data.present? 
      complete_data =  FreddieMacLoanOrigination.where("postal_code::text like ? and  loan_purpose = ?","#{zip.to_s.first(2).to_i}%", loan_purpose).where("first_payment_date >= ? and first_payment_date <= ?", start_year.beginning_of_year, end_year.end_of_year)
        zip_prefix = zip.to_s.first(2) + '000'
    end   

      (current_date.year-8..current_date.year-1).each do |year|
        date = DateTime.new(year)
        year_start = date.beginning_of_year
        year_end = date.end_of_year
        complete_year_data = complete_data.where("first_payment_date >= ? and first_payment_date <= ?", year_start, year_end)
        complete_year_data_count = complete_year_data.count
    
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
            avg_first_time_home_buyer_hash[year] = complete_year_data.where(first_time_home_buyer_flag: 'Y').count*100/complete_year_data_count.to_f
            avg_mortgage_insurance_percentage_hash[year] = complete_year_data.sum(:mortgage_insurance_percentage).to_f/complete_year_data_count
          else
        #for refinance report   
            purpose_c = complete_year_data.where(loan_purpose: 'C').count
            purpose_n = complete_year_data.where(loan_purpose: 'N').count
            n_c_total = purpose_c + purpose_n
            first_average_for_the_location[year] =  purpose_c.to_f/n_c_total
            second_average_for_the_location[year] = purpose_n.to_f*100/n_c_total  
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
      return main_hash, zip_prefix
  end  

end    