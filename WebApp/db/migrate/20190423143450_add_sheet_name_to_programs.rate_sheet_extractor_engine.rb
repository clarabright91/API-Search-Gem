# This migration comes from rate_sheet_extractor_engine (originally 20181219070637)
class AddSheetNameToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :sheet_name, :string
  end
end
