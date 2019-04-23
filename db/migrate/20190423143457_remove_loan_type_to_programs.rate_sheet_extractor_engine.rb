# This migration comes from rate_sheet_extractor_engine (originally 20190108104919)
class RemoveLoanTypeToPrograms < ActiveRecord::Migration[5.1]
  def change
  	remove_column :programs, :loan_type, :integer
  	add_column :programs, :loan_type, :string
  end
end
