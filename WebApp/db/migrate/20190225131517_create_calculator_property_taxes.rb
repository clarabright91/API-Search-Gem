class CreateCalculatorPropertyTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :calculator_property_taxes do |t|
      t.string :state_code
      t.float :tax_rate

      t.timestamps
    end
  end
end
