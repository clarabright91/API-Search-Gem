class DirectoriesController < ApplicationController
  before_action :state_name, only: [:state_mortgage_rates, :state_refinance_rates]
  before_action :bank_loan_type, only: [:state_mortgage_banks]
  def mortgage_states
    @states = City.pluck(:state_code).uniq.sort
  end

  def state_mortgage_rates
    @cities = if params[:state].present? && params[:lc].present?
      City.next_cities(params[:state],params[:lc])
    else  
      City.city_in_state(params[:state])
    end
  end

  def state_refinance_rates

  end

  def state_mortgage_banks
    @banks= if params[:alphabet].present? && params[:lb].present?
      FdicInstitution.search_term_next('name',@alphabet,params[:lb]) 
    else
      FdicInstitution.search_term('name',@alphabet)    
    end
  end

  def city_home_mortgage_rates
    @city = params[:city]
    @state = params[:state]
    all_news_articles = NewsArticle.where("search_term = ? OR search_term = ? ", params[:city]+" mortgage", params[:city]+', '+params[:state]+" mortgage")
    @news_articles = all_news_articles.last(10) #.order(id: :desc).first(10)  if all_news_articles.present?
  end 
   
  def bank_mortgage_loans
    byebug
  end

  private
    def state_name
      @state_name= params[:state]
    end
    
    def bank_loan_type
      @alphabet= params[:alphabet]
    end
    
end
