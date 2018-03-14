class CreateAdminPosts < ActiveRecord::Migration[5.1]
 
 def self.up
    create_table :admin_posts do |t|
   
      t.text   :post
      t.timestamps
    end

  end

  def self.down
    drop_table :admin_genders
  end

end
