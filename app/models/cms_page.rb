class CmsPage < ApplicationRecord
  validates :page_slug, uniqueness: {message: "Page slug already exist" }  # validation for unique slug

  after_save :reload_routes     #Reload/refresh after create/update new data

  scope :active, ->{where(status: true)}    # for finding all active cms pages

  def self.load
    Rails.application.routes.draw do
      if ActiveRecord::Base.connection.table_exists? 'cms_pages'
        CmsPage.all.each do |pg|
          #puts "Routing #{pg.page_name}"
          get "/#{pg.page_slug}", :to => "pages#show", defaults: { id: pg.id }
        end
      end
    end
  end

  def self.reload
    Rails.application.routes_reloader.reload!
  end

  def reload_routes
    CmsPage.reload
  end

end
