class NewsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default,
                  unique: true,
                  retry: false
  def perform
    require 'net/http'
    #require 'uri'
    #require 'json'
  
      # Section start for Microsoft Bing API Call--------------------------------------------------------
        #uri = URI('https://api.cognitive.microsoft.com/bing/v7.0/news')
        uri = URI('https://api.cognitive.microsoft.com/bing/v7.0/news/search')
        uri.query = URI.encode_www_form({
            # Request parameters
            'q' => 'microsoft',
            'count' => '50',
            'offset' => '0',
            'mkt' => 'en-us',
            'safeSearch' => 'Moderate'
        })
      
        request = Net::HTTP::Get.new(uri.request_uri)
          # Request headers
        request['Ocp-Apim-Subscription-Key'] = '98c48a8a18c24ee498ee152ace13e4f9'
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
              NewsArticle.find_or_initialize_by(search_term: data['name'],headline: data['name'], url: data['url'], text: data['description'], author: data['provider'].first['name'], api_type: 1, date_article: data['datePublished']) do |user|
               user.save!
              end  
            end  
          rescue => e
            p  e.message
          end
        end    
        nyt_data  #method calling for nyt
  end

private

  def nyt_data
    # NYT Api -----------------------------------------------------------------------
      uri = URI('https://api.nytimes.com/svc/search/v2/articlesearch.json')
      uri.query = URI.encode_www_form({
                    'q' => 'Sacramento',
                    'count' => '50'
                })
        request = Net::HTTP::Get.new(uri.request_uri)
        request['api-key'] ='7256321e913d427b94e9a2eb49c7c201'
        request.body = "{body}"
        nyt_response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        nyt_news = nyt_response.body.force_encoding('utf-8')
        nyt_parsed_data =  JSON.parse(nyt_news)
        if nyt_parsed_data['response'].present?
          begin
            nyt_parsed_data['response']['docs'].first(50).each do |nyt_data|
              NewsArticle.find_or_initialize_by(search_term: nyt_data['headline']['main'],headline: nyt_data['headline']['main'], url: nyt_data['web_url'], text: nyt_data['snippet'], author: nyt_data['byline'].present? ? nyt_data['byline']['organization'] : nil, api_type: 0, date_article: nyt_data['pub_date'].present? ? nyt_data['pub_date'] : nil,article_id: nyt_data['_id']) do |user|
               user.save!
              end   
            end  
          rescue => e
            p  e.message          
          end
        end    
  end

end
