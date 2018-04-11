ActiveAdmin.register User do
  menu false
  # Permitting Strong parameters
  permit_params :email, :password, :password_confirmation, :first_name,:last_name,:phone_number, :zip_code, :purpose, :home_price, :down_payment, :credit_score, :is_active, :price_alert, :last_search_id

  # Custom action for mass activation
  batch_action :activate, confirm: "Are you sure you want to activate these users?" do |ids|
    user_id=[]
    batch_action_collection.find(ids).each do |uid|
      user_id << uid.id
    end
    redirect_to activate_path(id: user_id)
  end

  # Custom action for mass deactivation
  batch_action :deactivate, confirm: "Are you sure you want to deactivate these users?" do |ids|
    user_id=[]
    batch_action_collection.find(ids).each do |uid|
      user_id << uid.id
    end
    redirect_to deactivate_path(id: user_id)
  end

  # Custom controller for removing password & password_confirmation from params
  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column "Status" do |usr|      #defining link on status
      link_to User.find(usr.id).is_active ? "Active" : "Deactive" , change_status_path(id: [usr.id])
    end
    column :created_at
    actions name: "Actions"
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :created_at

  show title: "User" do
    panel "User Details" do
      attributes_table_for user, :first_name,:last_name ,:email,:phone_number, :zip_code, :purpose, :home_price, :down_payment, :credit_score,:last_search_id,:price_alert, :is_active, :created_at, :updated_at
    end
  end

  form do |f|
    f.inputs 'Users' do
      f.input :first_name
      f.input :last_name
      f.input :email
      if f.object.new_record?     #condition for checking new_form only
        f.input :password
        f.input :password_confirmation
      end
      f.input :phone_number
      f.input :zip_code
      f.input :purpose
      f.input :home_price
      f.input :down_payment
      f.input :credit_score
      f.input :last_search_id
      f.input :price_alert, as: :select,include_blank: false, collection: {'off' => 0, 'daily' => 1, 'weekly'=> 2}  #for pricealert dropdown
      f.input :is_active
    end
    f.actions
  end
end
