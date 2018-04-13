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

  private
    def state_name
      @state_name= params[:state]
    end
    
    def bank_loan_type
      @alphabet= params[:alphabet]
    end
    
end
