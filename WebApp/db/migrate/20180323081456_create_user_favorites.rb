class CreateUserFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :user_favorites do |t|
      t.references :user, foreign_key: true
      #t.references :loan_tek_data, foreign_key: true
      t.integer :loan_tek_data_id, index: true
      t.timestamps
    end
  end
end
