class City < ApplicationRecord
  #validates :city,:state_code,:zip,:latitude,:longitude,presence: true
  #validates :county, presence: true

  # def self.city_in_state(state)
  #   where("lower(state_code) like ?","#{state.downcase}%").uniq(&:city).sort_by(&:city).pluck(:city).first(50)
  # end

  # def self.next_cities(state,last_city)
  #   where("state_code = ? AND city > ?", state, last_city).uniq(&:city).sort_by(&:city).pluck(:city).first(50)
  # end

  def self.city_in_state(state)
    where("lower(state_code) like ?","#{state.downcase}%").uniq(&:city).sort_by(&:id).first(50)
  end
  def self.next_cities(state,last_city)
    where("state_code = ? AND id > ?", state, last_city.to_i).uniq(&:city).sort_by(&:id).first(50)
  end
end
