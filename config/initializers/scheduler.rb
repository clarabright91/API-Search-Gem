=begin
form:           change password
Developer:      Varun
Created:        28-02-2018
Purpose:        executing jobs
=end

require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
scheduler.every '21s' do
  #NewsWorker.perform_async   # for performing asynchronous requests
  #NewsWorker.perform_in(1.minutes)
  #p 'current time'+Time.now.to_s
end
