class City < ApplicationRecord
  #validates :city,:state_code,:zip,:latitude,:longitude,presence: true
  #validates :county, presence: true

  def self.city_in_state(state)
    where("lower(state_code) like ?","#{state.downcase}%").sort_by(&:city).pluck(:city).first(50)
  end

  def self.next_cities(state,last_city)
    where("state_code = ? AND city > ?", state, last_city).pluck(:city).sort.first(50)
  end

end
