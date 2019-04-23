# This migration comes from rate_sheet_extractor_engine (originally 20181228121535)
class CreateProgramAdjustments < ActiveRecord::Migration[5.1]
  def change
    create_table :program_adjustments do |t|
      t.integer :program_id
      t.integer :adjustment_id
      t.timestamps
    end
  end
end
