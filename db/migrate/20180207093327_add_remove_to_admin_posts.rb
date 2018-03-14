class AddRemoveToAdminPosts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :admin_posts, :user, foreign_key: true
  end
end
