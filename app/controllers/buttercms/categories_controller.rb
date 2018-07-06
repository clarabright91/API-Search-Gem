=begin
  Developer:      Varun
  Purpose:        for showing categories.
  input:          categry params from strong params
  api:            butter cms api
  format:         json
  output:         category details from api  
=end
class Buttercms::CategoriesController < Buttercms::BaseController
  def show
    @category = ButterCMS::Category.find(params[:slug], :include => :recent_posts)
  end
end