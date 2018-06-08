class SeoPagesController < ApplicationController
  include ApplicationHelper
  include SeoPagesHelper
  #apply dry concept for common code
  before_action :city_home, only: [:city_home_mortgage_rates, :city_home_refinance_rates]
  before_action :bank_home, only: [:bank_mortgage_loans, :bank_personal_loans, :bank_auto_loans]

  def city_home_mortgage_rates
    @news_articles = NewsArticle.first(10) #news_article_data(' mortgage')
    # for report section fetching all cities record similer to current city 
    cached_data = FreddieMacCache.find_by('zip_prefix like ? and loan_type = ?', "#{@city.zip.to_s.first(3)+ '%'}", 'P')
    unless cached_data.present? 
      cached_data = FreddieMacCache.find_by('zip_prefix like ? and loan_type = ?', "#{@city.zip.to_s.first(2)+ '%'}", 'P')
    end

    if cached_data.present?
      @header = eval(cached_data.freddie_data.first(1).to_h.values.first).keys.sort
      #@report = cached_data.freddie_data
      @flag = true
    else
      #@header, @report, zip_prefix = historial_rates_report(@city.zip,'P')
      @flag = false
      #FreddieMacWorker.perform_async(zip_prefix,'P',@header, @report.to_json)
    end 
    #section end
    @loan_companies = FactualMortgageCompany.loan_companies_for_city(@city)
  end 

  def city_home_refinance_rates
    @news_articles = NewsArticle.first(10) #news_article_data(' refinance')
    # for report section fetching all cities record similer to current city
    # for loan type N & C
    cached_data = FreddieMacCache.find_by('zip_prefix like ? and loan_type = ?', "#{@city.zip.to_s.first(3)+ '%'}", 'N')
    unless cached_data.present? 
      cached_data = FreddieMacCache.find_by('zip_prefix like ? and loan_type = ?', "#{@city.zip.to_s.first(2)+ '%'}", 'N')
    end  

    if cached_data.present?
      @header = eval(cached_data.freddie_data.first(1).to_h.values.first).keys.sort
      #@report = cached_data.freddie_data
      @flag = true
    else
      #@header, @report, zip_prefix = historial_rates_report(@city.zip, 'N')
      @flag = false
      #FreddieMacWorker.perform_async(zip_prefix,'N',@header, @report.to_json)
    end
    #section end  
    @loan_officers = LoanOfficer.loan_officers_for_city(@city)
  end 

  def bank_mortgage_loans
    @news_articles = NewsArticle.first(10) #bank_news_article(" mortgage")
    #fetch loanofficer data using fuzzy search on the basis of search terms      
    @loan_officers= LoanOfficer.loan_officers_list(@bank.name, 'home',state_full_name(@bank.stname, true) )
    @loan_officers= LoanOfficer.loan_officers_list(@bank.name, 'mortgage', state_full_name(@bank.stname, true))    unless @loan_officers.present?
  end
    
  def bank_personal_loans 
    @news_articles = NewsArticle.first(10) #bank_news_article(" personal loans")
    @loan_officers = LoanOfficer.loan_officers_list(@bank.name,'personal',state_full_name(@bank.stname, true))
  end  

  def bank_auto_loans
    @news_articles = NewsArticle.first(10) #bank_news_article(" auto loans")
    @loan_officers = LoanOfficer.loan_officers_list(@bank.name,'auto', state_full_name(@bank.stname, true))
  end

  private

    def city_home
      city_home = City.find_by(id: params[:city_id])
      if city_home.present?
        @city = city_home
        @state = state_full_name(city_home.state_code, false) 
        all_city = City.where.not(city: @city.city).where(state_code: @city.state_code).select('distinct on (city) *')
        #uniq_city_ids= all_city.to_a.pluck(:id)
 
        g_city = all_city.to_a.map{|c| c.zip   if c.zip > @city.zip}.compact.sort.first(2)
        l_city = all_city.to_a.map{|c| c.zip   if c.zip < @city.zip}.compact.sort.last(3)
      
         @near_by_cities = City.where(zip: g_city.to_a + l_city.to_a).order(:zip)

        #g_city = all_city.where('zip > ?', @city.zip).limit(50).where(id: uniq_city_ids).to_a.last(3)
        #l_city = all_city.where('zip < ?',@city.zip).limit(50).where(id: uniq_city_ids).to_a.first(2)
        #@near_by_cities = g_city + l_city
        
        #old logic
        #@near_by_cities = []
        #City.where(state_code: city_home.state_code).where.not(city: @city.city).group_by(&:city).each do |key, val|
          #if val.count == 1
            #@near_by_cities << val
          #else
           # @near_by_cities << val.first
          #end
        #end         
      else
        content_not_found
      end  
    end  

    def news_article_data(flag)
      city_news_articles = NewsArticle.where("search_term = ? OR search_term = ?", @city.city+flag, @city.city+', '+@city.state_code+flag)
      return city_news_articles.order(id: :desc).first(10)
    end

    def bank_home
      bank_home = FdicInstitution.find_by(cert: params[:cert])
      if bank_home.present? && bank_home.used
        @state =  bank_home.stname
        @bank = bank_home
        @state_code = state_full_name(bank_home.stname, true)
        @near_by_banks = FdicInstitution.near_by_banks(bank_home.cert)
        @fdic_cal_data = FdicCalculation.find_by(cert: params[:cert])
      else
        content_not_found
      end  
    end

    def bank_news_article(flag)
      bank_news_articles = NewsArticle.where(search_term: @bank.name+flag)
      return bank_news_articles.order(id: :desc).first(10)
    end

end
