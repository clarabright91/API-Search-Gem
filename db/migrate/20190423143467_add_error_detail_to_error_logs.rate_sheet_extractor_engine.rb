# This migration comes from rate_sheet_extractor_engine (originally 20190304083138)
class AddErrorDetailToErrorLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :error_logs, :error_detail, :text
  end
end
