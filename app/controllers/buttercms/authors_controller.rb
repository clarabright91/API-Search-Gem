=begin
  Developer:      Varun
  Purpose:        for showing authors.
  input:          params from strong params
  api:            butter cms api
  format:         json
  output:         complete info about author from api  
=end
class Buttercms::AuthorsController < Buttercms::BaseController
  def show
    @author = ButterCMS::Author.find(params[:slug], :include => :recent_posts)
  end
end
