class AddAdminUserToAdminPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :admin_posts, :admin_user, foreign_key: true
  end
end
