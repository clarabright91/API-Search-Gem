class CreateCalculatorPriceToRentRatios < ActiveRecord::Migration[5.1]
  def change
    create_table :calculator_price_to_rent_ratios do |t|
      t.string :state_code, :null => false
      t.float :price_rent_ratio, :null => false
      t.string :city, :null => false

      t.timestamps
    end
  end
end
