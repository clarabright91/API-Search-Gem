class CreateAdminGenders < ActiveRecord::Migration[5.1]
 def self.up
    create_table :admin_genders do |t|
      t.string :name
      t.text   :body
      t.timestamps
    end

  end

  def self.down
    drop_table :admin_genders
  end
end

