class CreateFactualMortgageCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :factual_mortgage_companies do |t|
      t.string :factual_id, index: { unique: true }
      t.string :name, index: true
      t.string :address
      t.string :address_extended
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :neighborhoods
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website
      t.text :hours
      t.string :hours_display
      t.string :citysearch1_id
      t.string :citysearch1_url
      t.string :citysearch1_description
      t.string :citysearch1_reviews
      t.string :citysearch2_id
      t.string :citysearch2_url
      t.string :citysearch2_description
      t.string :citysearch2_reviews
      t.string :citysearch3_id
      t.string :citysearch3_url
      t.string :citysearch3_description
      t.string :citysearch3_reviews
      t.string :facebook1_id
      t.string :facebook1_url
      t.string :facebook1_description
      t.string :facebook1_profile
      t.string :facebook2_id
      t.string :facebook2_url
      t.string :facebook2_description
      t.string :facebook2_profile
      t.string :facebook3_id
      t.string :facebook3_url
      t.string :facebook3_description
      t.string :facebook3_profile
      t.string :foursquare1_id
      t.string :foursquare1_url
      t.string :foursquare1_description
      t.string :foursquare2_id
      t.string :foursquare2_url
      t.string :foursquare2_description
      t.string :foursquare3_id
      t.string :foursquare3_url
      t.string :foursquare3_description
      t.string :insiderpages1_id
      t.string :insiderpages1_url
      t.string :insiderpages1_description
      t.string :insiderpages2_id
      t.string :insiderpages2_url
      t.string :insiderpages2_description
      t.string :insiderpages3_id
      t.string :insiderpages3_url
      t.string :insiderpages3_description
      t.string :instagram1_id
      t.string :instagram1_url
      t.string :instagram1_description
      t.string :instagram2_id
      t.string :instagram2_url
      t.string :instagram2_description
      t.string :instagram3_id
      t.string :instagram3_url
      t.string :instagram3_description
      t.string :superpages1_id
      t.string :superpages1_url
      t.string :superpages1_description
      t.string :superpages1_reviews
      t.string :superpages2_id
      t.string :superpages2_url
      t.string :superpages2_description
      t.string :superpages2_reviews
      t.string :superpages3_id
      t.string :superpages3_url
      t.string :superpages3_description
      t.string :superpages3_reviews
      t.string :twitter1_id
      t.string :twitter1_url
      t.string :twitter1_description
      t.string :twitter2_id
      t.string :twitter2_url
      t.string :twitter2_description
      t.string :twitter3_id
      t.string :twitter3_url
      t.string :twitter3_description
      t.string :wikipedia1_id
      t.string :wikipedia1_url
      t.string :wikipedia1_description
      t.string :wikipedia2_id
      t.string :wikipedia2_url
      t.string :wikipedia2_description
      t.string :wikipedia3_id
      t.string :wikipedia3_url
      t.string :wikipedia3_description
      t.string :yahoolocal1_id
      t.string :yahoolocal1_url
      t.string :yahoolocal1_description
      t.string :yahoolocal1_reviews
      t.string :yahoolocal2_id
      t.string :yahoolocal2_url
      t.string :yahoolocal2_description
      t.string :yahoolocal2_reviews
      t.string :yahoolocal3_id
      t.string :yahoolocal3_url
      t.string :yahoolocal3_description
      t.string :yahoolocal3_reviews
      t.string :yellowpages1_id
      t.string :yellowpages1_url
      t.string :yellowpages1_description
      t.string :yellowpages2_id
      t.string :yellowpages2_url
      t.string :yellowpages2_description
      t.string :yellowpages3_id
      t.string :yellowpages3_url
      t.string :yellowpages3_description
      t.string :yelp1_id
      t.string :yelp1_url
      t.string :yelp1_description
      t.string :yelp1_reviews
      t.string :yelp2_id
      t.string :yelp2_url
      t.string :yelp2_description
      t.string :yelp2_reviews
      t.string :yelp3_id
      t.string :yelp3_url
      t.string :yelp3_description
      t.string :yelp3_reviews
      t.timestamps
    end
    add_index :factual_mortgage_companies, [:state, :city]
    add_index :factual_mortgage_companies, [:state, :latitude, :longitude], name: "index_mortgage_companies_on_state_and_latitude_and_longitude"
  end
end
