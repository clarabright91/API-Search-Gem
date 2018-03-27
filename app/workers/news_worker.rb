class NewsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default,
                  unique: true,
                  retry: false
  def perform(news_search_history)
    nsh = NewsSearchHistory.find(news_search_history)

    #NewsArticle.old_articles.destroy_all            if NewsArticle.old_articles.present? # Deleting 30 days old Articles
    #NewsArticle.where.not(id: NewsArticle.last(50)).destroy_all      if NewsArticle.count > 50 #Deleting old Articles if there are more then 50 records
    require 'net/http'
      # Section start for Microsoft Bing API Call--------------------------------------------------------
        uri = URI('https://api.cognitive.microsoft.com/bing/v7.0/news/search')
        uri.query = URI.encode_www_form({
            # Request parameters
            #'q' => 'microsoft',
            'q' => nsh.search_term,
            'count' => '50',
            'offset' => '0',
            'mkt' => 'en-us',
            'safeSearch' => 'Moderate'
        })
        request = Net::HTTP::Get.new(uri.request_uri)
          # Request headers
        if (nsh.id % 2 == 0)
          request['Ocp-Apim-Subscription-Key'] = '20cfcb8aebbb4220ae8a8345471a3206'
        else
          request['Ocp-Apim-Subscription-Key'] = '3edb05f41c334965a2561612b6f67ca3'
        end
          # Request body
        request.body = "{body}"
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        news = response.body.force_encoding('utf-8')
        parsed_data =  JSON.parse(news)
        if parsed_data['value'].present?
          begin
            parsed_data['value'].first(50).each do |data|
              NewsArticle.find_or_initialize_by(search_term: data['name'],headline: data['name'], url: data['url'], text: data['description'], author: data['provider'].first['name'], api_type: 1, date_article: data['datePublished']) do |api_record|
               api_record.save!
              end
            end
          rescue => e
            #p  e.message
          end
        end
      nyt_data(nsh)  #method calling for nyt
      #update news search history for bing
     nsh.update(last_searched_bing: DateTime.now)
  end

 private
  def nyt_data(nsh)
    # NYT Api -----------------------------------------------------------------------
      uri = URI('https://api.nytimes.com/svc/search/v2/articlesearch.json')
      uri.query = URI.encode_www_form({
                    'q' => nsh.search_term,
                    'count' => '50'
                })
        request = Net::HTTP::Get.new(uri.request_uri)
        if (nsh.id % 2 == 0)
          request['api-key'] ='7256321e913d427b94e9a2eb49c7c201'
        else
          request['api-key'] ='9b708bdf0ea943bab0cdae89607c421b'
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
              NewsArticle.find_or_initialize_by(search_term: nyt_data['headline']['main'],headline: nyt_data['headline']['main'], url: nyt_data['web_url'], text: nyt_data['snippet'], author: nyt_data['byline'].present? ? nyt_data['byline']['organization'] : nil, api_type: 0, date_article: nyt_data['pub_date'].present? ? nyt_data['pub_date'] : nil,article_id: nyt_data['_id']) do |api_data|
               api_data.save!
              end
            end
          rescue => e
            #p  e.message
          end
        end
        #update news search history for nyt
       nsh.update(last_searched_nyt: DateTime.now)
   end
end
