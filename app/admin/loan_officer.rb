ActiveAdmin.register LoanOfficer do
   menu false
  # Permitting Strong parameters
  permit_params :first,:last,:title,:company,:address,:city,:state,:zip,:county,:phone1,:phone2,:cell,:website,:email,:latitude,:longitude

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end
  
  index do
    selectable_column
    column :first
    column :last
    column :email
    column :created_at
    actions name: "Actions"
  end

  filter :first
  filter :last
  filter :email
  filter :created_at

  form do |f|
    f.inputs 'LoanOfficer' do
      f.input :first
      f.input :last
      f.input :title
      f.input :company
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :county
      f.input :phone1
      f.input :phone2
      f.input :cell
      f.input :website
      f.input :email
      f.input :latitude
      f.input :longitude
    end
    f.actions
  end
end
