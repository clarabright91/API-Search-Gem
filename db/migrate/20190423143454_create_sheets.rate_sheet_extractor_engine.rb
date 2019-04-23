# This migration comes from rate_sheet_extractor_engine (originally 20190103111715)
class CreateSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :sheets do |t|
      t.string :name
      t.integer :bank_id

      t.timestamps
    end
  end
end
