ActiveAdmin.register Expert do
  # Permitting Strong parameters
  permit_params :email, :first_name, :last_name, :phone, :license_number, :specialty, :website, :loan_type, :zip, :image, :verified, :remove_image

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column "Image" do |product|
      image_tag product.image, width:100,height:100
    end
    column :created_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :phone
  filter :loan_type, as: :select,include_blank: false, collection: {'mortgage' => 0,'refinance' => 1, 'personal'=> 2, 'auto' => 3}
  filter :created_at

  show title: "Expert" do
    panel "Expert Details" do
      attributes_table_for expert, :first_name,:image, :last_name,:image, :phone,:email,:loan_type, :license_number, :specialty, :website,:zip,:verified, :created_at, :updated_at
    end
  end

  # Used multipart form for upload image file
  form :html => { :enctype => "multipart/form-data"} do |f|
    f.inputs 'Experts' do
      f.input :first_name
      f.input :last_name
      f.input :image, hint: (("current image:<br/>").html_safe + f.image_tag(f.object.image.url(:thumb))).html_safe, as: :file  #display image
      if !f.object.new_record?
        f.input :remove_image, as: :boolean, required: false, label: "remove image"
      end
      f.input :phone
      f.input :email
      f.input :loan_type, as: :select,include_blank: "Select loan type", collection: {'mortgage' => 0,'refinance' => 1, 'personal'=> 2, 'auto' => 3}
      f.input :license_number
      f.input :specialty
      f.input :website
      f.input :zip
      f.input :verified
    end
    f.actions
  end
end
