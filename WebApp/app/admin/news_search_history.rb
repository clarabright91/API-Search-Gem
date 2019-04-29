=begin
  Developer:      Varun
  Purpose:        CRUD for News search history from admin login.
=end
ActiveAdmin.register NewsSearchHistory do
  #removing default menu
  menu false
  # Permitting Strong parameters
  permit_params :search_term,:last_searched_bing, :last_searched_nyt
  #for custom back action
  action_item 'Back', only: :show do
    link_to('Back', :back)
  end
  #for index page
  index do
    selectable_column
    column :search_term
    column :last_searched_bing
    column :last_searched_nyt
    actions name: "Actions"
  end
  #for filters in index page 
  filter :search_term
  filter :last_searched_bing
  filter :last_searched_nyt
  #for show page
  show title: "NewsSearchHistory" do
    panel "NewsSearchHistory Details" do
      attributes_table_for news_search_history, :search_term,:last_searched_bing, :last_searched_nyt
    end
  end
end
