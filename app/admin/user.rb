ActiveAdmin.register User do
menu priority: 1, label: "User"

permit_params :email, :password, :password_confirmation, :first_name,:last_name,:phone_number, :zip_code, :purpose, :home_price, :down_payment, :credit_score, :is_active, :price_alert, :last_search_id
  
  batch_action :activate do |ids|
    redirect_to activate_path(id: batch_action_collection.pluck(:id))
  end

  batch_action :deactivate do |ids|
    redirect_to deactivate_path(id: batch_action_collection.pluck(:id))
  end

  index do
    selectable_column
    #id_column
    column :first_name
    column :last_name
    column :email
    column "Status" do |usr|
      link_to User.find(usr.id).is_active ? "Active" : "Deactive" , change_status_path(id: [usr.id])
    end
    column :created_at
     actions 
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :created_at

  show title: "User" do
    panel "User Details" do
      attributes_table_for user, :first_name,:last_name ,:email,:phone_number, :zip_code, :purpose, :home_price, :down_payment, :credit_score,:last_search_id,:price_alert, :is_active, :created_at, :updated_at  
    end
     link_to 'Back', admin_users_path(resource)
  end  

  form do |f|
    f.inputs 'Users' do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :phone_number
      f.input :zip_code
      f.input :purpose
      f.input :home_price
      f.input :down_payment
      f.input :credit_score
      f.input :last_search_id
      f.input :price_alert, as: :select,include_blank: false, collection: {'off' => 0, 'daily' => 1, 'weekly'=> 2}
      f.input :is_active
    end
    f.actions
  end

end
