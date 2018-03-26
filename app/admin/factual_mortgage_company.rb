ActiveAdmin.register FactualMortgageCompany do
  # Permitting Strong parameters
  permit_params :factual_id,:name,:address,:address_extended,:city,:state,:zip,:country,:neighborhoods,:latitude,:longitude,:phone,:fax,:email,:website,:hours,:hours_display,:citysearch1_id,:citysearch1_url,:citysearch1_description,:citysearch1_reviews,:citysearch2_id,:citysearch2_url,:citysearch2_description,:citysearch2_reviews,:citysearch3_id,:citysearch3_url,:citysearch3_description,:citysearch3_reviews,:facebook1_id,:facebook1_url,:facebook1_description,:facebook1_profile,:facebook2_id,:facebook2_url,:facebook2_description,:facebook2_profile,:facebook3_id,:facebook3_url,:facebook3_description,:facebook3_profile,:foursquare1_id,:foursquare1_url,:foursquare1_description,:foursquare2_id,:foursquare2_url,:foursquare2_description,:foursquare3_id,:foursquare3_url,:foursquare3_description,:insiderpages1_id,:insiderpages1_url,:insiderpages1_description,:insiderpages2_id,:insiderpages2_url,:insiderpages2_description,:insiderpages3_id,:insiderpages3_url,:insiderpages3_description,:instagram1_id,:instagram1_url,:instagram1_description,:instagram2_id,:instagram2_url,:instagram2_description,:instagram3_id,:instagram3_url,:instagram3_description,:superpages1_id,:superpages1_url,:superpages1_description,:superpages1_reviews,:superpages2_id,:superpages2_url,:superpages2_description,:superpages2_reviews,:superpages3_id,:superpages3_url,:superpages3_description,:superpages3_reviews,:twitter1_id,:twitter1_url,:twitter1_description,:twitter2_id,:twitter2_url,:twitter2_description,:twitter3_id,:twitter3_url,:twitter3_description,:wikipedia1_id,:wikipedia1_url,:wikipedia1_description,:wikipedia2_id,:wikipedia2_url,:wikipedia2_description,:wikipedia3_id,:wikipedia3_url,:wikipedia3_description,:yahoolocal1_id,:yahoolocal1_url,:yahoolocal1_description,:yahoolocal1_reviews,:yahoolocal2_id,:yahoolocal2_url,:yahoolocal2_description,:yahoolocal2_reviews,:yahoolocal3_id,:yahoolocal3_url,:yahoolocal3_description,:yahoolocal3_reviews,:yellowpages1_id,:yellowpages1_url,:yellowpages1_description,:yellowpages2_id,:yellowpages2_url,:yellowpages2_description,:yellowpages3_id,:yellowpages3_url,:yellowpages3_description,:yelp1_id,:yelp1_url,:yelp1_description,:yelp1_reviews,:yelp2_id,:yelp2_url,:yelp2_description,:yelp2_reviews,:yelp3_id,:yelp3_url,:yelp3_description,:yelp3_reviews

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end

  index do
    selectable_column
    column :name
    column :phone
    column :address
    column :city
    column :state
    actions name: "Actions"
  end

  filter :name
  filter :phone
  filter :address
  filter :city

  form do |f|
    f.inputs 'FactualMortgageCompany' do
    f.input :factual_id
    f.input :name
    f.input :address
    f.input :address_extended
    f.input :city
    f.input :state
    f.input :zip
    f.input :country, as: 'string'
    f.input :neighborhoods
    f.input :latitude
    f.input :longitude
    f.input :phone
    f.input :fax
    f.input :email
    f.input :website
    f.input :hours
    f.input :hours_display
    f.input :citysearch1_id
    f.input :citysearch1_url
    f.input :citysearch1_description
    f.input :citysearch1_reviews
    f.input :citysearch2_id
    f.input :citysearch2_url
    f.input :citysearch2_description
    f.input :citysearch2_reviews
    f.input :citysearch3_id
    f.input :citysearch3_url
    f.input :citysearch3_description
    f.input :citysearch3_reviews
    f.input :facebook1_id
    f.input :facebook1_url
    f.input :facebook1_description
    f.input :facebook1_profile
    f.input :facebook2_id
    f.input :facebook2_url
    f.input :facebook2_description
    f.input :facebook2_profile
    f.input :facebook3_id
    f.input :facebook3_url
    f.input :facebook3_description
    f.input :facebook3_profile
    f.input :foursquare1_id
    f.input :foursquare1_url
    f.input :foursquare1_description
    f.input :foursquare2_id
    f.input :foursquare2_url
    f.input :foursquare2_description
    f.input :foursquare3_id
    f.input :foursquare3_url
    f.input :foursquare3_description
    f.input :insiderpages1_id
    f.input :insiderpages1_url
    f.input :insiderpages1_description
    f.input :insiderpages2_id
    f.input :insiderpages2_url
    f.input :insiderpages2_description
    f.input :insiderpages3_id
    f.input :insiderpages3_url
    f.input :insiderpages3_description
    f.input :instagram1_id
    f.input :instagram1_url
    f.input :instagram1_description
    f.input :instagram2_id
    f.input :instagram2_url
    f.input :instagram2_description
    f.input :instagram3_id
    f.input :instagram3_url
    f.input :instagram3_description
    f.input :superpages1_id
    f.input :superpages1_url
    f.input :superpages1_description
    f.input :superpages1_reviews
    f.input :superpages2_id
    f.input :superpages2_url
    f.input :superpages2_description
    f.input :superpages2_reviews
    f.input :superpages3_id
    f.input :superpages3_url
    f.input :superpages3_description
    f.input :superpages3_reviews
    f.input :twitter1_id
    f.input :twitter1_url
    f.input :twitter1_description
    f.input :twitter2_id
    f.input :twitter2_url
    f.input :twitter2_description
    f.input :twitter3_id
    f.input :twitter3_url
    f.input :twitter3_description
    f.input :wikipedia1_id
    f.input :wikipedia1_url
    f.input :wikipedia1_description
    f.input :wikipedia2_id
    f.input :wikipedia2_url
    f.input :wikipedia2_description
    f.input :wikipedia3_id
    f.input :wikipedia3_url
    f.input :wikipedia3_description
    f.input :yahoolocal1_id
    f.input :yahoolocal1_url
    f.input :yahoolocal1_description
    f.input :yahoolocal1_reviews
    f.input :yahoolocal2_id
    f.input :yahoolocal2_url
    f.input :yahoolocal2_description
    f.input :yahoolocal2_reviews
    f.input :yahoolocal3_id
    f.input :yahoolocal3_url
    f.input :yahoolocal3_description
    f.input :yahoolocal3_reviews
    f.input :yellowpages1_id
    f.input :yellowpages1_url
    f.input :yellowpages1_description
    f.input :yellowpages2_id
    f.input :yellowpages2_url
    f.input :yellowpages2_description
    f.input :yellowpages3_id
    f.input :yellowpages3_url
    f.input :yellowpages3_description
    f.input :yelp1_id
    f.input :yelp1_url
    f.input :yelp1_description
    f.input :yelp1_reviews
    f.input :yelp2_id
    f.input :yelp2_url
    f.input :yelp2_description
    f.input :yelp2_reviews
    f.input :yelp3_id
    f.input :yelp3_url
    f.input :yelp3_description
    f.input :yelp3_reviews
    end
    f.actions
  end
end
