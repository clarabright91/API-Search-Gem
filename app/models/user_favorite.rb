class UserFavorite < ApplicationRecord
  #associated with users table
  belongs_to :user
  # needs to be done
  #belongs_to :loan_tek_data
end
