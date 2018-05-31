ActiveAdmin.register FreddieMacCache do
  config.filters = false
  actions :all, except: [:new, :edit, :destroy]
  permit_params :city_id, :loan_type, :cached_year, :freddie_data
  action_item 'Data Cache', only: :index do
    link_to 'Data Cache', city_freddie_cache_data_path, method: :get
  end
  menu false

  index do
    selectable_column
    column :city_id
    column :loan_type
    column :cached_year
    column :created_at
    column :updated_at
    actions name: "Actions"
  end

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end
end