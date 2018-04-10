class DirectoriesController < ApplicationController
  def mortgage_states
    @states = City.pluck(:state_code).uniq.sort

  end

  def state_mortgage_rates
    @state_name= params[:state]
  end

end
