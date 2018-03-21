ActiveAdmin.register_page "UploadCsv" do
  require 'csv'
  # CSV File import section
	page_action :import_csv, method: :post do
	  if (params[:dump][:file].content_type.to_s=='text/csv')
			#calling convert_save function defined in upload_csv model
      csv_up= CsvDb.convert_save(params[:dump][:file],params[:model])
			#flash msg based on response came from upload_csv model
			if csv_up
        flash[:notice] = 'Data Saved Successfully.'
      else
        flash[:alert] = 'Wrong File or Data Uploaded.'
      end
			 # Rediraction after upload CSV file
       redirect_to admin_uploadcsv_path
    else
      flash[:error] = "Only CSV files are allowed."
      redirect_back(fallback_location: 'localhost:3000')
    end
  end

  #Rendering upload_csv partial page
  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
     panel "File Upload" do
       div do
        render :partial => "admin/upload_csv/upload_csv"
       end
     end
    end
  end
end
