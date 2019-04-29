class AddColumnToFreddieMacCache < ActiveRecord::Migration[5.1]
  def change
    remove_column :freddie_mac_caches, :city_id
    add_column :freddie_mac_caches, :zip_prefix, :string 
  end
end
