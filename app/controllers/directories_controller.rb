class DirectoriesController < ApplicationController
  before_action :state_name, only: [:mortgage_state_cities,:mortgage_state_cities_list, :refinance_state_cities, :refinance_state_cities_list]
  before_action :banks_search, only: [:mortgage_state_banks, :personal_loan_state_banks]
  before_action :cities_in_state, only: [:mortgage_state_cities, :refinance_state_cities]
  before_action :city_list, only: [:mortgage_state_cities_list, :refinance_state_cities_list] 
  before_action :state_banks_list, only: [:mortgage_state_banks_list, :personal_loan_state_banks_list]
  
  def directory_root
    @states = City.pluck(:state_code).uniq.sort
  end

  def mortgage_state_cities
    @flag = 'mortgage'
  end

  def mortgage_state_cities_list
    @flag = 'mortgage'
  end
   
  def refinance_state_cities
    @flag = 'refinance'
  end

  def refinance_state_cities_list
    @flag = 'refinance'
  end

  def mortgage_state_banks
    @flag = 'mortgage_loan'
  end

  def personal_loan_state_banks
    @flag = 'personal_loan'
  end

  def mortgage_state_banks_list
    @flag = 'mortgage_loan'
  end

  def personal_loan_state_banks_list
    @flag = 'personal_loan'
  end

  private
    def state_name
      @state_name= params[:state]
    end
    
    def banks_search
      @alphabet= params[:alphabet]
      @banks= FdicInstitution.search_term(@alphabet)
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

    def state_banks_list
      form_no = params[:form_no]
      bank_from = 'bank_from_'+form_no
      bank_to = 'bank_to_'+form_no
      alphabet = params[:alphabet]
      @banks = FdicInstitution.banks_list(alphabet,params[bank_from.to_sym],params[bank_to.to_sym])
    end  
end
