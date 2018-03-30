class CreateFreddieMacLoanOriginations < ActiveRecord::Migration[5.1]
  def change
    create_table :freddie_mac_loan_originations do |t|
      t.integer :credit_score
      t.datetime :first_payment_date
      t.string :first_time_home_buyer_flag
      t.datetime :maturity_date
      t.integer :metropolitan_statistical_area
      t.integer :mortgage_insurance_percentage
      t.integer :number_of_units
      t.string :occupancy_status
      t.integer :original_combined_loan_to_value
      t.integer :original_debt_to_income_ratio
      t.integer :original_upb, length: 8
      t.integer :original_loan_to_value
      t.float :original_interest_rate
      t.string :channel
      t.string :prepayment_penalty_mortgage_flag
      t.string :product_type
      t.string :property_state
      t.string :property_type
      t.integer :postal_code, index: true
      t.string :loan_sequence_number, index: { unique: true }
      t.string :loan_purpose
      t.integer :original_loan_term
      t.integer :number_of_borrowers
      t.string :seller_name
      t.string :service_name
      t.string :super_conforming_flag
      t.string :pre_harp_loan_sequence_number
      t.timestamps
    end
  end
end
