=begin
  Developer:      Varun
  Purpose:        for showing feeds.
  input:          params from strong params
  api:            butter cms api
  format:         json
  output:         complete info about feeds from api  
=end
class Buttercms::FeedsController < Buttercms::BaseController
  def sitemap
    feed = ButterCMS::Feed.find(:sitemap)

    render :xml => feed.data
  end

  def atom
    feed = ButterCMS::Feed.find(:atom)

    render :xml => feed.data
  end

  def rss
    feed = ButterCMS::Feed.find(:rss)

    render :xml => feed.data
  end
end
