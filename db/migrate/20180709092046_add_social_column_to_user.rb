class AddSocialColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :social_login, :string
  end
end
