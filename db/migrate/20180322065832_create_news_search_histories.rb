class CreateNewsSearchHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :news_search_histories do |t|
      t.string :search_term
      t.text :last_searched_bing
      t.text :last_searched_nyt
      t.timestamps
    end
  end
end
