class CreateFreddieMacCaches < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :freddie_mac_caches do |t|
      t.integer :city_id
      t.integer :cached_year
      t.hstore  :freddie_data
      t.string  :loan_type
      t.timestamps
    end
  end
end
