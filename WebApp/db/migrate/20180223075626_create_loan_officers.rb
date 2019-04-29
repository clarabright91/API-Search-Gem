class CreateLoanOfficers < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_officers do |t|
      t.string :first
      t.string :last
      t.string :title
      t.string :company, index: true
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :county
      t.string :phone1
      t.string :phone2
      t.string :cell
      t.string :website
      t.string :email
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    add_index :loan_officers, [:state, :city]
    add_index :loan_officers, [:state, :latitude, :longitude]
  end
end
