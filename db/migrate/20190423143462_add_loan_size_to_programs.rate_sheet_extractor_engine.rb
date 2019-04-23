# This migration comes from rate_sheet_extractor_engine (originally 20190128093423)
class AddLoanSizeToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :loan_size, :string
  end
end
