ActiveAdmin.register City do
  # Permitting Strong parameters
  permit_params :city,:state_code,:zip,:latitude,:longitude,:county

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end

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

  filter :city
  filter :state_code
  filter :zip
  filter :latitude
  filter :longitude
  filter :created_at

  show title: "City" do
    panel "City Details" do
      attributes_table_for city, :city,:state_code,:zip,:latitude,:longitude,:county
    end
  end

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
