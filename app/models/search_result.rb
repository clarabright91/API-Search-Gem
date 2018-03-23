class SearchResult < ApplicationRecord
  # association with user table, it is optional because user may or may not be present 
  belongs_to :user, optional: true
end
