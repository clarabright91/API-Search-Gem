# This migration comes from rate_sheet_extractor_engine (originally 20190409094748)
class AddArmBenchmarkToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :arm_benchmark, :string
    add_column :programs, :arm_margin, :float
  end
end
