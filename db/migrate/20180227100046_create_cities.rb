class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :city
      t.string :state_code
      t.string :zip
      t.string :latitude
      t.string :longitude
      t.string :county
      t.timestamps
    end
  end
end
