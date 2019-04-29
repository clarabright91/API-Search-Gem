=begin
  Developer:      Varun
  Purpose:        CRUD for city
=end
ActiveAdmin.register City do
  # Permitting Strong parameters
  permit_params :city,:state_code,:zip,:latitude,:longitude,:county

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end
  # for index page 
  index do
    selectable_column
    column :city
    column :state_code
    column :zip
    column :latitude
    column :longitude
    column :county
    actions name: "Actions"
  end
  # for filter
  filter :city
  filter :state_code
  filter :zip
  filter :latitude
  filter :longitude
  filter :created_at
  # for city show page
  show title: "City" do
    panel "City Details" do
      attributes_table_for city, :city,:state_code,:zip,:latitude,:longitude,:county
    end
  end
  #for city new and edit pages 
  form do |f|
    f.inputs 'City' do
      f.input :city
      f.input :state_code
      f.input :zip
      f.input :latitude
      f.input :longitude
      f.input :county
    end
    f.actions
  end
end
