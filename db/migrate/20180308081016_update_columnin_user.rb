class UpdateColumninUser < ActiveRecord::Migration[5.1]
  def change
    #for admin user
    #add_index :admin_users, :email, unique: true  
    #for cities
    change_column :cities, :latitude, 'float USING CAST(latitude AS float)'
    change_column :cities, :longitude, 'float USING CAST(longitude AS float)'
    change_column :cities, :created_at, 'timestamp USING CAST(created_at AS timestamp)'
    change_column :cities, :updated_at, 'timestamp USING CAST(updated_at AS timestamp)'
    add_index :cities, :zip, unique: true
    add_index :cities, [:latitude, :longitude, :state_code]
    #for experts
    add_column :experts, :loan_type, :integer
    add_column :experts, :zip, :integer
    remove_column :experts, :image
    add_attachment :experts, :image     
    add_column :experts, :verified, :boolean, default: false
    add_index :experts, :email, unique: true
    rename_column :experts, :state_id, :state
    rename_column :experts, :city_id, :city
    add_index :experts, [:city,:state]
    #for factual_mortgage_companies
    change_column :factual_mortgage_companies, :latitude, 'float USING CAST(latitude AS float)'
    change_column :factual_mortgage_companies, :longitude, 'float USING CAST(longitude AS float)'
    change_column :factual_mortgage_companies, :created_at, 'timestamp USING CAST(created_at AS timestamp)'
    change_column :factual_mortgage_companies, :updated_at, 'timestamp USING CAST(updated_at AS timestamp)'
    add_index :factual_mortgage_companies, :factual_id, unique: true
    add_index :factual_mortgage_companies, [:state, :city]
    #for institutions
    change_column :institutions, :cert, 'integer USING CAST(cert AS integer)'
    add_index :institutions, :cert, unique: true
    add_index :institutions, [:stname, :city]
    rename_table :institutions, :fdic_institutions
    #for loan officer
    #change_column :loan_officers, :latitude, 'float USING CAST(latitude AS float)'
    #change_column :loan_officers, :longitude, 'float USING CAST(longitude AS float)'
    add_index :loan_officers, [:state, :city]
    #for users
    remove_column :users, :name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :last_search_id, :integer
    add_column :users, :price_alert, :integer
  end
end
