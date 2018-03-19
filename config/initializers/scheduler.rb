require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '41s' do
  #NewsWorker.perform_async   # for performing asynchronous requests
  #NewsWorker.perform_in(1.minutes)
  #p 'current time'+Time.now.to_s
end