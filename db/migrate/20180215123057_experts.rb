class Experts < ActiveRecord::Migration[5.1]
   def self.up
    create_table :experts do |t|
   
      t.string   :first_name
      t.string   :last_name
      t.string   :phone
      t.string	 :email,              null: false, default: ""
      t.string   :state_id	
      t.string   :city_id
      t.string   :license_number
      t.string   :specialty
      t.string   :website
      t.string   :image
      t.timestamps
    end

  end

  def self.down
    drop_table :experts
  end
end
