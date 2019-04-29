# This migration comes from rate_sheet_extractor_engine (originally 20190306101433)
class CreateSubSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_sheets do |t|
      t.string :name
      t.integer :sheet_id
      t.timestamps
    end
  end
end
