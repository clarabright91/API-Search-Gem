=begin
  Developer:      Varun
  Purpose:        CRUD for freddire mac cache from admin login.
=end
ActiveAdmin.register FreddieMacCache do
  #for removing default filters
  config.filters = false
  #allowing specific actions only
  actions :all, except: [:new, :edit, :destroy]
  #permitting params
  permit_params :zip_prefix, :loan_type, :cached_year, :freddie_data
  #for starting background workers
  action_item 'Data Cache', only: :index do
    link_to 'Data Cache', city_freddie_cache_data_path, method: :get
  end
  #for removing default menu
  menu false
  #for index page
  index do
    #selectable_column
    column :zip_prefix
    column :loan_type
    column :cached_year
    column :created_at
    column :updated_at
    actions name: "Actions"
  end
  #for custom back action
  action_item 'Back', only: :show do
    link_to('Back', :back)
  end
end