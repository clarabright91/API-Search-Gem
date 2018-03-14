class CreateLoanOfficers < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_officers do |t|
      t.string :first
      t.string :last
      t.string :title
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :phone1
      t.string :phone2
      t.string :cell
      t.string :website
      t.string :email
      t.string :latitude
      t.string :longitude  
      t.timestamps
    end
  end
end
