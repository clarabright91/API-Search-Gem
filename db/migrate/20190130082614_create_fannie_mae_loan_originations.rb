class CreateFannieMaeLoanOriginations < ActiveRecord::Migration[5.1]
  def change
    create_table :fannie_mae_loan_originations do |t|
      t.string :loan_identifier
      t.string :origination_channel
      t.string :seller_name
      t.float :original_interest_rate
      t.integer :original_upb
      t.integer :original_loan_term
      t.datetime :origination_date
      t.datetime :first_payment_date
      t.integer :original_loan_to_value_ltv
      t.integer :original_combined_loan_to_value_cltv
      t.integer :number_of_borrowers
      t.integer :original_debt_to_income_ratio
      t.integer :borrower_credit_score_at_origination
      t.boolean :first_time_home_buyer_indicator
      t.string :loan_purpose
      t.string :property_type
      t.integer :number_of_units
      t.string :occupancy_type
      t.string :property_state
      t.string :zip_code_short
      t.integer :primary_mortage_insurance_percent
      t.string :product_type
      t.integer :co_borrower_credit_score_at_origination
      t.integer :mortage_insurance_type
      t.boolean :relocation_mortage_indicator
      t.timestamps
    end
  end
end
