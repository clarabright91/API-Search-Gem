class AddColumnsToNewsArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :loan_officers, :latitude, 'float USING CAST(latitude AS float)'
    change_column :loan_officers, :longitude, 'float USING CAST(longitude AS float)'
    add_column :news_articles, :article_id, :string, index: true, unique: true
    add_index :news_articles, :api_type
  end
end
