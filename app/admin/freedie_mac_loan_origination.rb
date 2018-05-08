ActiveAdmin.register FreddieMacLoanOrigination, as: "FreddieMac"  do
  # Permitting Strong parameters
  actions :all, except: [:new, :edit, :destroy]
  permit_params :credit_score, :first_payment_date, :first_time_home_buyer_flag, :maturity_date,:metropolitan_statistical_area,:mortgage_insurance_percentage,:number_of_units, :occupancy_status,:original_combined_loan_to_value,:original_debt_to_income_ratio,:original_upb,:original_loan_to_value,:original_interest_rate, :channel,:prepayment_penalty_mortgage_flag, :product_type, :property_state, :property_type, :postal_code,:loan_sequence_number,:loan_purpose,:original_loan_term,:number_of_borrowers, :seller_name, :service_name, :super_conforming_flag, :pre_harp_loan_sequence_number

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end

index pagination_total: false do
  #index do
    selectable_column
    column :credit_score
    column :first_payment_date
    column :maturity_date
    column :postal_code
    column :loan_sequence_number
    actions name: "Actions"
  end

  filter :credit_score
  filter :first_payment_date
  filter :maturity_date
  filter :postal_code
  filter :loan_sequence_number

  form do |f|
    f.object.first_payment_date ||= DateTime.now
    f.object.maturity_date ||= DateTime.now
    f.inputs 'FreddieMacLoanOrigination' do
      f.input :credit_score
      f.input :first_payment_date,start_year: 1990, end_year: 2100,include_blank: false
      f.input :first_time_home_buyer_flag
      f.input :maturity_date, start_year: 1990, end_year: 2100,include_blank: false
      f.input :metropolitan_statistical_area
      f.input :mortgage_insurance_percentage
      f.input :number_of_units
      f.input :occupancy_status
      f.input :original_combined_loan_to_value
      f.input :original_debt_to_income_ratio
      f.input :original_upb
      f.input :original_loan_to_value
      f.input :original_interest_rate
      f.input :channel
      f.input :prepayment_penalty_mortgage_flag
      f.input :product_type
      f.input :property_state
      f.input :property_type
      f.input :postal_code
      f.input :loan_sequence_number
      f.input :loan_purpose
      f.input :original_loan_term
      f.input :number_of_borrowers
      f.input :seller_name
      f.input :service_name
      f.input :super_conforming_flag
      f.input :pre_harp_loan_sequence_number
    end
    f.actions
  end
end
