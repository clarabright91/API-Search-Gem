class SeoPagesController < ApplicationController
  before_action :city_home, only: [:city_home_mortgage_rates, :city_home_refinance_rates]
  before_action :bank_home, only: [:bank_mortgage_loans, :bank_personal_loans]

  def city_home_mortgage_rates
    @news_articles = news_article_data(' mortgage')
  end 

  def city_home_refinance_rates
    @news_articles = news_article_data(' refinance')
  end 

  def bank_mortgage_loans
      @news_articles = bank_news_article(" mortgage")
  end
    
  def bank_personal_loans  
    @news_articles = bank_news_article(" personal loans")
  end  


  private
    def original_details(info)
      return info.tr('+',' ')
    end

    def city_home
      city_home = City.find(params[:city_id])
      @city = city_home.present? ? city_home.city : original_details(params[:city])
      @state = original_details(params[:state])
    end  

    def news_article_data(flag)
      city_news_articles = NewsArticle.where("search_term = ? OR search_term = ?", @city+flag, @city+', '+@state+flag)
      return city_news_articles.order(id: :desc).first(10)
    end

    def bank_home
      bank_home = FdicInstitution.find(params[:bank_id])
      @state = params[:state]
      @bank = bank_home.present? ? bank_home.name : original_details(params[:bank_name])
    end

    def bank_news_article(flag)
      bank_news_articles = NewsArticle.where(search_term: @bank+flag)
      return bank_news_articles.order(id: :desc).first(10)
    end

end
