=begin
form:           change password
Developer:      Varun
Created:        28-02-2018
Purpose:        executing jobs
=end

# require 'rufus-scheduler'
# scheduler = Rufus::Scheduler.new
# scheduler.every '50s' do #calling schedular after every 50 seconds
#   nsh = NewsSearchHistory.find_by("date(updated_at) = ?", 1.days.ago.to_date) #Fetching uniq news search history object
#     NewsWorker.perform_async(nsh.id) #sending news_search_history id for background worker
#     p 'current time'+Time.now.to_s
# end



# optimised query
#NewsSearchHistory.where("date(updated_at) = ?", 1.days.ago.to_date).first
# for exact match
#NewsSearchHistory.where("? <= updated_at AND updated_at <= ?", 3.months.ago.beginning_of_day, 3.months.ago.end_of_day)
