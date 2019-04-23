# This migration comes from rate_sheet_extractor_engine (originally 20190327124341)
class AddDuToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :du, :boolean
    add_column :programs, :lp, :boolean
  end
end
