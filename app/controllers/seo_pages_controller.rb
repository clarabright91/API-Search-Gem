class SeoPagesController < ApplicationController
  

  def city_home_mortgage_rates
    city_home = City.find(params[:city_id])
    @city = city_home.present? ? city_home.city : original_details(params[:city])
    @state = original_details(params[:state])
    city_news_articles = NewsArticle.where("search_term = ? OR search_term = ? ", @city+" mortgage", @city+', '+@state+" mortgage")
    @news_articles = city_news_articles.order(id: :desc).first(10)  
  end 

  def bank_mortgage_loans
    bank_home = FdicInstitution.find(params[:bank_id])
    @state = params[:state]
    @bank = bank_home.present? ? bank_home.name : original_details(params[:bank_name])
    bank_news_articles = NewsArticle.where(search_term: @bank+" mortgage")
    @news_articles = bank_news_articles.order(id: :desc).first(10)  
  end
  
  private
    def original_details(info)
      return info.tr('+',' ')
    end  
end
