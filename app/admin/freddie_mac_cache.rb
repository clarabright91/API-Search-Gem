ActiveAdmin.register FreddieMacCache do
  config.filters = false
  actions :all, except: [:new, :edit, :destroy]
  permit_params :city_id, :loan_type, :cached_year, :freddie_data

  menu false

  index do
    selectable_column
    column :city_id
    column :loan_type
    column :created_at
    column :cached_year
    actions name: "Actions"
  end

  action_item  only: :index do
    link_to 'Data Cache', city_freddie_cache_data_path, method: :get
  end

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end
end