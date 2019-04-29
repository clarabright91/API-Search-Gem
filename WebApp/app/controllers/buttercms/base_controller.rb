=begin
  Developer:      Varun
  Purpose:        base controller for butter cms
  api:            butter cms api
  format:         json
=end
class Buttercms::BaseController < ActionController::Base
  # You can of course change this layout to your main application layout
  # to have your blog match the rest of your site.
  layout 'buttercms/default'
end
