ActiveAdmin.register CmsPage do
  # Permitting Strong parameters
  permit_params :page_name, :page_content, :page_slug, :meta_title,:meta_description,:status

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end
  
  index do
    selectable_column
    column :page_name
    column :page_slug
    column :meta_title
    column :status
    actions name: "Actions"
  end

  filter :page_name  
  filter :page_slug
  filter :status

  form do |f|
    f.inputs 'CmsPage' do
      f.input :page_name
      f.input :page_content, :as => :ckeditor
      if f.object.new_record?     # non editable field
        f.input :page_slug
      else
        f.input :page_slug, input_html: { disabled: true }
      end
      f.input :meta_title
      f.input :meta_description
      f.input :status
    end
    f.actions
  end
end
