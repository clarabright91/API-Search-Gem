class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
	add_column :users, :phone_number, :string
	add_column :users, :zip_code, :integer
	add_column :users, :purpose, :string
	add_column :users, :home_price, :string
	add_column :users, :down_payment, :string
	add_column :users, :credit_score, :string
  end
end
