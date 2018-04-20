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
    where("lower(state_code) like ?","#{state.downcase}%").uniq(&:city).sort_by(&:city)
  end

  def self.citiy_list(start_city,end_city,state)
     where("lower(state_code) = ?", state.downcase).where(city: start_city..end_city).select('distinct on (city) *').sort_by(&:city).first(50) 
    #where("lower(state_code) = ? AND lower(city) = ? Between lower(city) = ?", state,start_city,end_city).uniq(&:city).sort_by(&:city)
  end
end
