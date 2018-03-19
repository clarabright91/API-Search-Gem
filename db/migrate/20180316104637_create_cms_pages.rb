class CreateCmsPages < ActiveRecord::Migration[5.1]
  def change
    create_table :cms_pages do |t|
      t.string :page_name
      t.text :page_content
      t.string :page_slug, index: { unique: true}
      t.string :meta_title
      t.text :meta_description
      t.boolean :status
      t.timestamps
    end
  end
end
