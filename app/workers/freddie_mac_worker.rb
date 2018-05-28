class FreddieMacWorker
  include Sidekiq::Worker

  def perform(city_id,loan_type,header_array, main_hash)
    data = JSON.parse(main_hash)
    begin
      FreddieMacCache.create!(city_id: city_id, cached_year: Date.today.year, freddie_data: data, loan_type: loan_type )
    rescue => e
      p e.messages
    ensure
      GC.start
    end
  end 

end