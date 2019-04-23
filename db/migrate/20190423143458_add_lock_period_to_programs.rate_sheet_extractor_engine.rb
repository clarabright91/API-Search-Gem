# This migration comes from rate_sheet_extractor_engine (originally 20190109115312)
class AddLockPeriodToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :lock_period, :integer, array: true, default: []
    add_column :programs, :loan_limit_type, :string, array: true, default: []
  end
end
