class SeoPagesController < ApplicationController
  include ApplicationHelper

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
    @loan_officers= LoanOfficer.loan_officers_list(@state_code,@bank, 'home')
    #@loan_officers = FactualMortgageCompany.where('lower(title) like ? AND lower(city) like ? AND lower(state) like ? AND lower(company) = ?', "%#{term}%",bank.city.downcase, state_code.downcase, bank.name.downcase)
    @security = FdicSecurity.find_by(name: @bank.name, city: @bank.city)
    @us_govt_obl = FdicUsGovernmentObligation.find_by(name: @bank.name, city: @bank.city)
    @good_will = FdicGoodwillAndOtherIntangible.find_by(name: @bank.name, city: @bank.city)
    @managed_assets = FdicTotalManagedAssetsHeldInFiduciaryAccount.find_by(name: @bank.name, city: @bank.city)
    @net_loan_and_leases = FdicNetLoansAndLease.find_by(name: @bank.name, city: @bank.city)
  end
    
  def bank_personal_loans  
    @news_articles = bank_news_article(" personal loans")
    @loan_officers = LoanOfficer.loan_officers_list(@state_code, @bank,'personal')
    @past_due_and_assets = FdicPastDueAndNonaccrualAsset.find_by(name: @bank.name, city: @bank.city)
    @loss_share = FdicCarryingAmountOfAssetsCoveredByFdicLossShareAgreement.find_by(name: @bank.name, city: @bank.city)
    @bank_assets_and_sec = FdicBankAssetsSoldAndSecuritized.find_by(name: @bank.name, city: @bank.city)
    @max_amt_and_credit = FdicMaximumAmountOfCreditExposureRetained.find_by(name: @bank.name, city: @bank.city)
    @unused_commitments = FdicUnusedCommitment.find_by(name: @bank.name, city: @bank.city)
    @loan_charges_off = FdicLoanChargeOffsAndRecovery.find_by(name: @bank.name, city: @bank.city)
  end  

  def bank_auto_loans
    @news_articles = bank_news_article(" auto loans")
    @loan_officers = LoanOfficer.loan_officers_list(@state_code, @bank,'auto')
    @net_loan_and_leases = FdicNetLoansAndLease.find_by(name: @bank.name, city: @bank.city)
    @past_due_and_assets = FdicPastDueAndNonaccrualAsset.find_by(name: @bank.name, city: @bank.city)
    @bank_assets_and_sec = FdicBankAssetsSoldAndSecuritized.find_by(name: @bank.name, city: @bank.city)
    @max_amt_and_credit = FdicMaximumAmountOfCreditExposureRetained.find_by(name: @bank.name, city: @bank.city)
    @unused_commitments = FdicUnusedCommitment.find_by(name: @bank.name, city: @bank.city)
    @loan_charges_off = FdicLoanChargeOffsAndRecovery.find_by(name: @bank.name, city: @bank.city)
    @net_loan_and_leases = FdicNetLoansAndLease.find_by(name: @bank.name, city: @bank.city)
  end

  private
    def original_details(info)
      return info.tr('+',' ')
    end

    def city_home
      city_home = City.find(params[:city_id])
      if city_home.present?
        @city = city_home.city 
        @state = original_details(params[:state])
        @near_by_cities = []
        City.where(state_code: city_home.state_code).where.not(city: @city).group_by(&:city).each do |key, val|
          if val.count == 1
            @near_by_cities << val
          else
            @near_by_cities << val.first
          end
        end    
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
        @near_by_banks = FdicInstitution.where(city: bank_home.city, stname: bank_home.stname).where.not(id: bank_home).limit(5)
      else
        content_not_found
      end  
    end

    def bank_news_article(flag)
      bank_news_articles = NewsArticle.where(search_term: @bank.name+flag)
      return bank_news_articles.order(id: :desc).first(10)
    end

end
