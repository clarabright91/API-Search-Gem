 # Worker for Microsoft Bing & Nyt API Calls
class NewsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default,
                  unique: true,
                  retry: false
  def perform(news_search_history)
    nsh = NewsSearchHistory.find(news_search_history)
    #require 'net/http'
        uri = URI('https://api.cognitive.microsoft.com/bing/v7.0/news/search')
        uri.query = URI.encode_www_form({
            'q' => nsh.search_term,
            'count' => '50',
            'offset' => '0',
            'mkt' => 'en-us',
            'safeSearch' => 'Moderate'
        })
        request = Net::HTTP::Get.new(uri.request_uri)
        if (nsh.id % 2 == 0)
          request['Ocp-Apim-Subscription-Key'] = BING_API_KEY_1
        else
          request['Ocp-Apim-Subscription-Key'] = BING_API_KEY_2
        end
        request.body = "{body}"
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        news = response.body.force_encoding('utf-8')
        parsed_data =  JSON.parse(news)
        if parsed_data['value'].present?
          begin
            parsed_data['value'].first(50).each do |data|
              NewsArticle.find_or_initialize_by(headline: data['name'], search_term: nsh.search_term, api_type: BING_NEWS_API_TYPE) do |api_record|
               api_record.url = data['url']
               api_record.text = data['description']
               api_record.author = data['provider'].first['name']
               api_record.date_article = data['datePublished']
               api_record.save!
              end
            end
          rescue => e
            #p  e.message
          end
        end
      nyt_data(nsh)    #method calling for nyt
     nsh.update(last_searched_bing: DateTime.now)    #update news search history for bing
     old_articles(nsh)   #for deleting old articles
  end

 private
  def nyt_data(nsh)
      uri = URI('https://api.nytimes.com/svc/search/v2/articlesearch.json')
      uri.query = URI.encode_www_form({
                    'q' => nsh.search_term,
                    'count' => '50'
                })
        request = Net::HTTP::Get.new(uri.request_uri)
        if (nsh.id % 2 == 0)
          request['api-key'] = NYT_API_KEY_1
        else
          request['api-key'] = NYT_API_KEY_2
        end
        request.body = "{body}"
        nyt_response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        nyt_news = nyt_response.body.force_encoding('utf-8')
        nyt_parsed_data =  JSON.parse(nyt_news)
        if nyt_parsed_data['response'].present?
          begin
            nyt_parsed_data['response']['docs'].first(50).each do |nyt_data|
              NewsArticle.find_or_initialize_by(api_type: NYT_NEWS_API_TYPE, article_id: nyt_data['_id']) do |api_data|
                api_data.search_term = nsh.search_term
                api_data.headline = nyt_data['headline']['main']
                api_data.url = nyt_data['web_url']
                api_data.text =nyt_data['snippet']
                api_data.author = nyt_data['byline'].present? ? nyt_data['byline']['organization'] : nil
                api_data.date_article = nyt_data['pub_date'].present? ? nyt_data['pub_date'] : nil
                api_data.save!
              end
            end
          rescue => e
            #p  e.message
          end
        end
       nsh.update(last_searched_nyt: DateTime.now)      #update news search history for nyt
   end

   def old_articles(nsh)
    news_articles = NewsArticle.where(search_term: nsh.search_term).order(date_article: :desc)
     if news_articles.present? 
      all_news_article_id = news_articles.pluck(:id)          
      latest_articles = news_articles.first(50).pluck(:id)   
      old_articles = all_news_article_id - latest_articles
      NewsArticle.where(id: old_articles).destroy_all        if old_articles.present?
     end 
   end
end
