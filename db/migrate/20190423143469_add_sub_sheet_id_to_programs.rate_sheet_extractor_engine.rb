# This migration comes from rate_sheet_extractor_engine (originally 20190306120308)
class AddSubSheetIdToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :sub_sheet_id, :integer
  end
end
