class City < ApplicationRecord
  #validates :city,:state_code,:zip,:latitude,:longitude,presence: true
  #validates :county, presence: true

  def self.city_in_state(state)
    where("lower(state_code) like ?","#{state.downcase}%").uniq(&:city).sort_by(&:city)
  end

  def self.cities_list(start_city,end_city,state) 
     begin
       all_city = city_in_state(state) 
       s_city = all_city.index(find(start_city))
       l_city = all_city.index(find(end_city))
      return all_city[s_city..l_city]
     rescue
      return false 
     end
  end

end
