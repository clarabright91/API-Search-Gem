ActiveAdmin.register City do
  # Permitting Strong parameters
  permit_params :city,:state_code,:zip,:latitude,:longitude,:county

  index do
    selectable_column
    column :city
    column :state_code
    column :zip
    column :latitude
    column :longitude
    column :county
    actions
  end

  filter :city
  filter :state_code
  filter :zip
  filter :latitude
  filter :longitude
  filter :created_at

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
