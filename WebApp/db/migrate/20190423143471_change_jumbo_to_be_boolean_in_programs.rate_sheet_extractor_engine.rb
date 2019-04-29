# This migration comes from rate_sheet_extractor_engine (originally 20190311131351)
class ChangeJumboToBeBooleanInPrograms < ActiveRecord::Migration[5.1]
  def change
    change_column :programs, :jumbo, :boolean, :default => false
  end
end
