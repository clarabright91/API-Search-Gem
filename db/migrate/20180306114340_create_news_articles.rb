class CreateNewsArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :news_articles do |t|
      t.string :search_term, index: true
      t.datetime :date_article
      t.string :url
      t.string :author
      t.text :headline
      t.string :snippet
      t.text :text
      t.integer :api_type
      t.timestamps
    end
  end
end
