# This migration comes from rate_sheet_extractor_engine (originally 20181221132423)
class RemoveInterestPointsToPrograms < ActiveRecord::Migration[5.1]
  def change
  	remove_column :programs, :interest_points, :text
  	add_column :programs, :base_rate, :json
  end
end
