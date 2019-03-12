class CreateCalculatorHomeAffordabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :calculator_home_affordabilities do |t|
      t.date :date, :null => false
      t.string :state_code, :null => false
      t.float :home_price_index, :null => false

      t.timestamps
    end
  end
end