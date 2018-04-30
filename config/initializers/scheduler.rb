=begin
Developer:      Varun
Created:        26-03-2018
Purpose:        scheduling and executing jobs
=end

require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
scheduler.every '50s' do #calling scheduler after every 50 seconds
  #nsh = NewsSearchHistory.find_by("updated_at IS NULL OR date(updated_at) <= ?", 3.months.ago.to_date) #Fetching uniq news search history
  nsh = NewsSearchHistory.find_by("updated_at IS NULL OR date(updated_at) <= ?", 10.days.ago.to_date)
  NewsWorker.perform_async(nsh.id) if nsh.present? #sending news_search_history id for background worker
end
