class CreateAutoResponders < ActiveRecord::Migration[5.1]
  def change
    create_table :auto_responders do |t|
      t.string :subject, index: true
      t.text :template
      t.boolean :status
      t.timestamps
    end
  end
end
