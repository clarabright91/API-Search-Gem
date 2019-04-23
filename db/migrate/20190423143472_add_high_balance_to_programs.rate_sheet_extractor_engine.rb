# This migration comes from rate_sheet_extractor_engine (originally 20190311131823)
class AddHighBalanceToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :high_balance, :boolean, default: false
  end
end
