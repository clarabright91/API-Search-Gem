class FreddieMacWorker
  include Sidekiq::Worker

  def perform(zip_prefix,loan_type,header_array, main_hash)
    data = JSON.parse(main_hash)
    begin
      fmc = FreddieMacCache.find_or_create_by(zip_prefix: zip_prefix, loan_type: loan_type)
       fmc.cached_year = Date.today.year
       fmc.freddie_data = data
       fmc.save!
    rescue => e
      p e.message
    # ensure
    #   GC.start
    end
  end 

end