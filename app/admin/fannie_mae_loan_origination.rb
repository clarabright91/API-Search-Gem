ActiveAdmin.register FannieMaeLoanOrigination, as: "FannieMae"  do
  menu :parent => "Freddie Data"
  actions :all, except: [:new, :edit, :destroy]
  index pagination_total: false do
  #index do
    selectable_column
    column :loan_identifier
    column :first_payment_date
    column :seller_name
    column :zip_code_short
    column :original_interest_rate
    actions name: "Actions"
  end
end
