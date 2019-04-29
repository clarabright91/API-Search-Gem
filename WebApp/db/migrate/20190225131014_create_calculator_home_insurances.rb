class CreateCalculatorHomeInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :calculator_home_insurances do |t|
      t.string :state_code, :null => false
      t.float :insurance_rate, :null => false
      t.float :avg_annual_insurance, :null => false

      t.timestamps
    end
  end
end
