class ForDropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :active_admin_comments
    drop_table :admin_genders
    drop_table :admin_posts
  end
end
