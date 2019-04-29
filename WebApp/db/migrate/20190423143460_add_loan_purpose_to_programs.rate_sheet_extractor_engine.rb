# This migration comes from rate_sheet_extractor_engine (originally 20190116120636)
class AddLoanPurposeToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :loan_purpose, :string
  end
end
