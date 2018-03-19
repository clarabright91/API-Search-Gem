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
  # for dynamic cmspages
  CmsPage.load                      if CmsPage.present?
  #root to: 'activity#mine'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
