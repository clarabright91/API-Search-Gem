class Experts < ActiveRecord::Migration[5.1]
   def change
    create_table :experts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email,index: { unique: true }, null: false
      t.string :state, index: true
      t.string :city, index: true
      t.string :license_number
      t.string :specialty
      t.string :website
      t.attachment :image
      t.integer :zip
      t.integer :loan_type
      t.boolean :verified, default: false
      t.timestamps
    end
  end
end
