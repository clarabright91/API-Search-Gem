class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :city
      t.string :state_code
      t.integer :zip, index: { unique: true }
      t.float :latitude
      t.float :longitude
      t.string :county
      t.timestamps
    end
    add_index :cities, [:state_code, :latitude, :longitude]
    add_index :cities, [:state_code, :city]
  end
end
