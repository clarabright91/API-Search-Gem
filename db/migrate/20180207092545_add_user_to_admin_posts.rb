class AddUserToAdminPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :admin_posts, :user, foreign_key: true
  end
def self.down
      remove_column :admin_posts, :user_id
  end
end
