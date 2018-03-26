class CreateMortgageSearchResults < ActiveRecord::Migration[5.1]
  def change
    create_table :mortgage_search_results do |t|
      t.references :user, foreign_key: true
      t.string :city
      t.string :state
      t.integer :zip
      t.float :latitude
      t.float :longitude
      t.text :search_input
      t.text :response
      t.integer :search_type
      t.integer :loan_type
      t.timestamps
    end
    add_index :mortgage_search_results, [:state, :city, :search_type]
    add_index :mortgage_search_results, [:latitude, :longitude, :search_type], name: 'index_search_results_on_latitude_and_longitude_and_search_type'
  end
end
