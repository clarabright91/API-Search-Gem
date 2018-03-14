ActiveAdmin.register NewsArticle ,as: "NewsArticle" do
  actions :all, except: [:new, :edit]
  permit_params :search_term,:date_article, :datetime, :url, :author, :headline, :text, :api_type

  index do
    selectable_column
    id_column
    column :date_article
    #column :url
    column :headline
    column :author
    column :snippet
    column :text
    column :created_at
    actions
  end
  
    filter :date_article
    filter :api_type, as: :select,include_blank: false, collection: {'New York Times'=>0,'Microsoft Bing'=>1}

    show title: "NewsArticle" do
    panel "NewsArticle Details" do
      attributes_table_for news_article, :search_term,:date_article, :datetime, :url, :author, :headline, :text
    end
  end  

end
