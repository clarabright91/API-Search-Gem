class DirectoriesController < ApplicationController
  include ApplicationHelper
  #apply dry concept for performing common operations
  before_action :state_name, only: [:mortgage_state_cities,:mortgage_state_cities_list, :refinance_state_cities, :refinance_state_cities_list]
  before_action :banks_search, only: [:mortgage_state_banks, :personal_loan_state_banks, :auto_loan_state_banks]
  before_action :cities_in_state, only: [:mortgage_state_cities, :refinance_state_cities]
  before_action :city_list, only: [:mortgage_state_cities_list, :refinance_state_cities_list] 
  before_action :state_banks_list, only: [:mortgage_state_banks_list, :personal_loan_state_banks_list, :auto_loan_state_banks_list]
  
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

  def auto_loan_state_banks
    @flag = 'auto_loan'
  end

  def mortgage_state_banks_list
    @flag = 'mortgage_loan'
  end

  def personal_loan_state_banks_list
    @flag = 'personal_loan'
  end

  def auto_loan_state_banks_list
    @flag = 'auto_loan'
  end

  private
    def state_name
      @state_name= params[:state]
    end
    
    def banks_search
      @alphabet= params[:alphabet]
      @banks= if @alphabet == '1'
        FdicInstitution.search_term_special  
      else
        FdicInstitution.search_term(@alphabet)
      end
    end
    
    def cities_in_state
      @cities = City.city_in_state(params[:state])
    end

    def city_list
      city_from = params[:city_from]
      city_to = params[:city_to]
      if city_from.present? && city_to.present?
         if City.cities_list(city_from,city_to,@state_name)
            @cities = City.cities_list(city_from,city_to,@state_name)
          else
            content_not_found   #rendering 404 page if ids are not present
         end   
      else 
         content_not_found  #rendering 404 page if ids are not present
      end 
    end

    def state_banks_list
      form_no = params[:form_no]
      bank_from = 'bank_from_'+form_no
      bank_to = 'bank_to_'+form_no
      alphabet = params[:alphabet]

      @banks = if alphabet == '1'             #for special alphabet or number
        FdicInstitution.banks_list_special(params[bank_from.to_sym],params[bank_to.to_sym])
      else  
        FdicInstitution.banks_list(alphabet,params[bank_from.to_sym],params[bank_to.to_sym])
      end
    end  
end
