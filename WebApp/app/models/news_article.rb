class NewsArticle < ApplicationRecord
  #Uniqueness validation for article_id
  validates :article_id, uniqueness: true, allow_nil: true
  #scope for checking old articles
  scope :old_articles, -> { where('created_at <= ?', Time.now - 30.days)}
  # for index page 
  enum api_type: {NewYorkTimes: 0, MicrosoftBing: 1}
end
