class DirectoriesController < ApplicationController
  before_action :state_name, only: [:mortgage_state_cities,:mortgage_state_cities_list, :state_refinance_rates]
  before_action :bank_loan_type, only: [:mortgage_state_banks]

  def mortgage_states
    @states = City.pluck(:state_code).uniq.sort
  end

  def mortgage_state_cities
    @cities = if params[:state].present? && params[:lc].present?
      City.next_cities(params[:state],params[:lc])
    else  
      City.city_in_state(params[:state])
    end
  end

  def mortgage_state_cities_list
    form_no = params[:form_no]
    city_from = 'city_from_'+form_no
    city_to = 'city_to_'+form_no
    @cities = City.cities_list(params[city_from.to_sym],params[city_to.to_sym],@state_name)
  end
   
  def bank_mortgage_loans
    #byebug
  end
  
  def state_refinance_rates

  end

  def mortgage_state_banks
    @banks= FdicInstitution.search_term(@alphabet)    
  end

  def mortgage_state_banks_list
    form_no = params[:form_no]
    bank_from = 'bank_from_'+form_no
    bank_to = 'bank_to_'+form_no
    @banks = FdicInstitution.banks_list(params[bank_from.to_sym],params[bank_to.to_sym])  
  end

  private
    def state_name
      @state_name= params[:state]
    end
    
    def bank_loan_type
      @alphabet= params[:alphabet]
    end
    
end
