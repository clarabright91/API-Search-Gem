class DirectoriesController < ApplicationController
  
  def mortgage_states
    @states = City.pluck(:state_code).uniq.sort
  end

  def city_home_mortgage_rates
    @city = params[:city]
    @state = params[:state]
    all_news_articles = NewsArticle.where("search_term = ? OR search_term = ? ", params[:city]+" mortgage", params[:city]+', '+params[:state]+" mortgage")
    @news_articles = all_news_articles.last(10) #.order(id: :desc).first(10)  if all_news_articles.present?
  end 
   
  def bank_mortgage_loans
    #byebug
  end

  
    
end
