ActiveAdmin.register_page "UploadCsv" do
	require 'csv'
	# CSV File import section
	page_action :import_csv, method: :post do
		if (params[:dump][:file].content_type.to_s=='text/csv')
			csv_up= CsvDb.convert_save(params[:dump][:file],params[:model]) #calling convert_save function defined in upload_csv model
      if csv_up																											#Showing flash msg based on response came from upload_csv model
        flash[:notice] = 'Data Saved Successfully.'
      else
        flash[:alert] = 'Wrong File or Data Uploaded.'
      end
	    redirect_to admin_uploadcsv_path																# Rediraction after upload CSV file
		else
			flash[:error] = "Only CSV files are allowed."
			redirect_back(fallback_location: 'localhost:3000')
		end
	end

	content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
    	panel "File Upload" do
    		div do
    			render :partial => "admin/upload_csv/upload_csv" 					#Rendering upload_csv partial page
    		end
    	end
    end
  end
end
