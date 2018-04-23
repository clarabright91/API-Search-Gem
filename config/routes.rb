Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  ActiveAdmin.register_page "UploadCsv"

 # authenticated :user do
   # root to: 'pages#index', as: :authenticated_root
  # end

  root 'pages#index'
  post '/contact_us_email', to: 'pages#contact_us_email'
  get '/change_status', to: 'pages#change_status'
  get '/activate', to: 'pages#user_mass_activate'
  get '/deactivate', to: 'pages#user_mass_deactivate'
  
  get '/profile', to: 'pages#user_profile'
  
  put '/update_profile', to: 'pages#update_profile' 
  
  get '/pages/:page_slug',to: 'pages#show'  #slug'll not work in devise view pages 
  # for dynamic cmspages
  CmsPage.load                      if CmsPage.present?



  #--------------------------- routes for bank pages ---------------------------------
  get '/mortgage/lender/:alphabet', to: 'directories#mortgage_state_banks', as: 'mortgage_state_banks'  

  post '/mortgage/lender/:bank_list', to: 'directories#mortgage_state_banks_list', as: 'mortgage_state_banks_list'


  #-------------------------- routes for directory pages------------------------------
  get '/directory', to: 'directories#mortgage_states', as: 'directory'

  get '/mortgage/:state', to: 'directories#mortgage_state_cities', as: 'mortgage_state_cities'

  post '/mortgage/:state/:city_list', to: 'directories#mortgage_state_cities_list', as: 'mortgage_state_cities_list' 
    
  #--------------------------- routes for seo pages ----------------------------------
  get '/mortgage/:state/:city+mortgage+rate', to: 'seo_pages#city_home_mortgage_rates', as: 'city_home_mortgage_rates' 




  get '/mortgage/bank/:name+"demo"', to: 'directories#bank_mortgage_loans'

  get '/refinance/:state', to: 'directories#state_refinance_rates'

  match '*path', to: redirect('/'), via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
