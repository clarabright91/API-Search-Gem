class NewsArticle < ApplicationRecord
  #Uniqueness validation for article_id
  validates :article_id, uniqueness: true
  #scope for checking article old articles
  scope :old_articles, -> { where('created_at <= ?', Time.now - 30.days)}
end
