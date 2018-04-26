class DirectoriesController < ApplicationController
  before_action :state_name, only: [:mortgage_state_cities,:mortgage_state_cities_list, :refinance_state_cities, :refinance_state_cities_list]
  before_action :bank_loan_type, only: [:mortgage_state_banks]
  before_action :cities_in_state, only: [:mortgage_state_cities, :refinance_state_cities]
  before_action :city_list, only: [:mortgage_state_cities_list, :refinance_state_cities_list]
  before_action :mortgage_flag, only: [:mortgage_state_cities, :mortgage_state_cities_list]
  before_action :refinance_flag, only: [:refinance_state_cities, :refinance_state_cities_list] 
  def mortgage_states
    @states = City.pluck(:state_code).uniq.sort
  end

  def mortgage_state_cities
      
  end

  def mortgage_state_cities_list
    
  end
   
  def refinance_state_cities
      
  end

  def refinance_state_cities_list
    
  end


  def mortgage_state_banks
    @banks= FdicInstitution.search_term(@alphabet)    
  end

  def mortgage_state_banks_list
    form_no = params[:form_no]
    bank_from = 'bank_from_'+form_no
    bank_to = 'bank_to_'+form_no
    alphabet = params[:alphabet]
    @banks = FdicInstitution.banks_list(alphabet,params[bank_from.to_sym],params[bank_to.to_sym])  
  end

  private
    def state_name
      @state_name= params[:state]
    end
    
    def bank_loan_type
      @alphabet= params[:alphabet]
    end
    
    def cities_in_state
      @cities = City.city_in_state(params[:state])
    end

    def city_list
      form_no = params[:form_no]
      city_from = 'city_from_'+form_no
      city_to = 'city_to_'+form_no
      @cities = City.cities_list(params[city_from.to_sym],params[city_to.to_sym],@state_name)
    end

    def mortgage_flag
      @flag = 'mortgage'
    end
    
    def refinance_flag
      @flag = 'refinance'
    end
end
