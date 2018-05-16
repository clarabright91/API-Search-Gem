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

  # def self.near_by_cities(city_name, city_home)
  #   except_self = where.not(city: city_name)
  #   c1 = except_self.where('state_code = ? and zip > ?', city_home.state_code, city_home.zip).order(zip: :DESC).limit(2)
  #   c2 = except_self.where('state_code = ? and zip < ?', city_home.state_code, city_home.zip).order(zip: :ASC).limit(3)
  #   return c1 + c2
  # end 

end
