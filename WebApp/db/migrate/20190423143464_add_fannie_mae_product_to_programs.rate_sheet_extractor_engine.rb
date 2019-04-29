# This migration comes from rate_sheet_extractor_engine (originally 20190205080327)
class AddFannieMaeProductToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :fannie_mae_product, :string
    add_column :programs, :freddie_mac_product, :string
  end
end
