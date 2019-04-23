# This migration comes from rate_sheet_extractor_engine (originally 20190311130644)
class RenameJumboHighBalanceColumnOfPrograms < ActiveRecord::Migration[5.1]
  def change
    rename_column :programs, :jumbo_high_balance, :jumbo
  end
end
