class CreateSearchResults < ActiveRecord::Migration[5.1]
  def change
    create_table :search_results do |t|
      t.references :user, foreign_key: true
      t.string :city, index: true
      t.string :state, index: true
      t.integer :zip
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.text :search_input
      t.text :response
      t.integer :search_type, index: true
      t.integer :loan_type
      t.timestamps
    end
  end
end
