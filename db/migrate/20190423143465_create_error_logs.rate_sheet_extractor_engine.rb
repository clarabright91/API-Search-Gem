# This migration comes from rate_sheet_extractor_engine (originally 20190226121700)
class CreateErrorLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :error_logs do |t|
    	t.text :details
    	t.integer :column
    	t.integer :row
    	t.string  :sheet_name
    	t.integer :sheet_id
    	t.boolean  :status, default: false
      t.timestamps
    end
  end
end
