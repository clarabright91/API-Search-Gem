class SeoPagesController < ApplicationController
  include ApplicationHelper
  include SeoPagesHelper
  #apply dry concept for common code
  before_action :city_home, only: [:city_home_mortgage_rates, :city_home_refinance_rates]
  before_action :bank_home, only: [:bank_mortgage_loans, :bank_personal_loans, :bank_auto_loans]

  def city_home_mortgage_rates
    @news_articles = news_article_data(' mortgage')
  end 

  def city_home_refinance_rates
    @news_articles = news_article_data(' refinance')
  end 

  def bank_mortgage_loans
    @news_articles = bank_news_article(" mortgage")
    #fetch loanofficer data using fuzzy search on the basis of search terms      
    @loan_officers= LoanOfficer.loan_officers_list(@bank.name, 'home')
    @loan_officers= LoanOfficer.loan_officers_list(@bank.name, 'mortgage')    unless @loan_officers.present?
    @security = FdicSecurity.find_by(cert: @bank.cert)
    @us_govt_obl = FdicUsGovernmentObligation.find_by(cert: @bank.cert)
    @good_will = FdicGoodwillAndOtherIntangible.find_by(cert: @bank.cert)
    @managed_assets = FdicTotalManagedAssetsHeldInFiduciaryAccount.find_by(cert: @bank.cert)
    @net_loan_and_leases = FdicNetLoansAndLease.find_by(cert: @bank.cert)
  end
    
  def bank_personal_loans 
    @news_articles = bank_news_article(" personal loans")
    @loan_officers = LoanOfficer.loan_officers_list(@bank.name,'personal')
    @past_due_and_assets = FdicPastDueAndNonaccrualAsset.find_by(cert: @bank.cert)
    @loss_share = FdicCarryingAmountOfAssetsCoveredByFdicLossShareAgreement.find_by(cert: @bank.cert)
    @bank_assets_and_sec = FdicBankAssetsSoldAndSecuritized.find_by(cert: @bank.cert)
    @max_amt_and_credit = FdicMaximumAmountOfCreditExposureRetained.find_by(cert: @bank.cert)
    @unused_commitments = FdicUnusedCommitment.find_by(cert: @bank.cert)
    @loan_charges_off = FdicLoanChargeOffsAndRecovery.find_by(cert: @bank.cert)
  end  

  def bank_auto_loans
    @news_articles = bank_news_article(" auto loans")
    @loan_officers = LoanOfficer.loan_officers_list(@bank.name,'auto')
    @net_loan_and_leases = FdicNetLoansAndLease.find_by(cert: @bank.cert)
    @past_due_and_assets = FdicPastDueAndNonaccrualAsset.find_by(cert: @bank.cert)
    @bank_assets_and_sec = FdicBankAssetsSoldAndSecuritized.find_by(cert: @bank.cert)
    @max_amt_and_credit = FdicMaximumAmountOfCreditExposureRetained.find_by(cert: @bank.cert)
    @unused_commitments = FdicUnusedCommitment.find_by(cert: @bank.cert)
    @loan_charges_off = FdicLoanChargeOffsAndRecovery.find_by(cert: @bank.cert)
    @net_loan_and_leases = FdicNetLoansAndLease.find_by(cert: @bank.cert)
  end

  private

    def city_home
      city_home = City.find_by(id: params[:city_id])
      if city_home.present?
        @city = city_home.city
        @state = state_full_name(city_home.state_code, false) 
    
         #@near_by_cities = City.where("SELECT DISTINCT(city), FROM cities WHERE state_code = ? AND zip < ? limit 2",city_home.state_code ,city_home.zip)
        @near_by_cities = []
        City.where(state_code: city_home.state_code).where.not(city: @city).group_by(&:city).each do |key, val|
          if val.count == 1
            @near_by_cities << val
          else
            @near_by_cities << val.first
          end
        end 
        similer_cities = City.where(city: city_home.city).pluck(:zip) #fetching all city record similer to current city
        @header, @report = historial_rates_report(similer_cities)   
      else
        content_not_found
      end  
    end  

    def news_article_data(flag)
      city_news_articles = NewsArticle.where("search_term = ? OR search_term = ?", @city+flag, @city+', '+@state+flag)
      return city_news_articles.order(id: :desc).first(10)
    end

    def bank_home
      bank_home = FdicInstitution.find_by(cert: params[:cert])
      if bank_home.present?
        @state =  bank_home.stname
        @bank = bank_home
        @state_code = state_full_name(bank_home.stname, true)
        @near_by_banks = FdicInstitution.near_by_banks(bank_home.cert)
      else
        content_not_found
      end  
    end

    def bank_news_article(flag)
      bank_news_articles = NewsArticle.where(search_term: @bank.name+flag)
      return bank_news_articles.order(id: :desc).first(10)
    end

end
