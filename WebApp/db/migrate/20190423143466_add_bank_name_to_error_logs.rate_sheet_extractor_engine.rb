# This migration comes from rate_sheet_extractor_engine (originally 20190301141055)
class AddBankNameToErrorLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :error_logs, :bank_name, :string
  end
end
