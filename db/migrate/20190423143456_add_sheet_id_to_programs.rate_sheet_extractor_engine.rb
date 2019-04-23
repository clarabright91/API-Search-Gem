# This migration comes from rate_sheet_extractor_engine (originally 20190108103116)
class AddSheetIdToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :sheet_id, :integer
  end
end
