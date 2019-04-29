ActiveAdmin.register FannieMaeLoanOrigination, as: "FannieMae" do
  menu parent: 'Freddie Data', label: 'Fannie mae'
  actions :all, except: [:new, :edit, :destroy]
  index :title => "Fannie Mae" do
    selectable_column
    column :loan_identifier
    column :first_payment_date
    column :seller_name
    column :zip_code_short
    column :original_interest_rate
    actions name: "Actions"
  end
end
