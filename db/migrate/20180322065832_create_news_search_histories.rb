class CreateNewsSearchHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :news_search_histories do |t|
      t.string :search_term, index: { unique: true }
      t.datetime :last_searched_bing, index: true
      t.datetime :last_searched_nyt, index: true
      t.timestamps
    end
    add_index :news_search_histories, :updated_at
  end
end
