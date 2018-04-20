class SeoPagesController < ApplicationController
  before_action :state_name, only: [:mortgage_state_cities,:mortgage_state_cities_list, :state_refinance_rates]
  before_action :bank_loan_type, only: [:state_mortgage_banks]

  def mortgage_state_cities
    @cities = if params[:state].present? && params[:lc].present?
      City.next_cities(params[:state],params[:lc])
    else  
      City.city_in_state(params[:state])
    end
  end

  def mortgage_state_cities_list
    city_list= params[:city_list]
    city_list_array = city_list.tr("+", " ").split("to")
    starting_city = city_list_array[0].strip
    ending_city = city_list_array[1].strip
    @cities = City.citiy_list(starting_city,ending_city,@state_name)
    #byebug
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
