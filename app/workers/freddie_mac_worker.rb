class FreddieMacWorker
  include Sidekiq::Worker

  def perform(city_id,loan_type,header_array, main_hash)
    data = JSON.parse(main_hash)
    begin
      FreddieMacCache.find_or_initialize_by(city_id: city_id, loan_type: loan_type) do |fmc|
       fmc.cached_year = Date.today.year
       fmc.freddie_data = data
       fmc.save!
      end 
    rescue => e
      p e.messages
    # ensure
    #   GC.start
    end
  end 

end