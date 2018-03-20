class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :city
      t.string :state_code, index: true
      t.integer :zip, index: { unique: true }
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.string :county
      t.timestamps
    end
  end
end
