class DirectoriesController < ApplicationController
  before_action :state_name, only: [:state_mortgage_rates, :state_refinance_rates]
  
  def mortgage_states
    @states = City.pluck(:state_code).uniq.sort

  end

  def state_mortgage_rates
    
  end

  def state_refinance_rates

  end

  private
    def state_name
      @state_name= params[:state]
    end

end
