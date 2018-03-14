ActiveAdmin.register_page "UploadCsv" do
	require 'csv'
	page_action :import_csv, method: :post do
		if (params[:dump][:file].content_type.to_s=='text/csv')
		#CsvDb.convert_save("admin_post", params[:dump][:file],"admin_user")   
		csv_up= CsvDb.convert_save(params[:dump][:file],params[:model])
    
    flash[:notice] = csv_up
		#redirect_to :controller => 'dashboard', :action => 'index'
  
    redirect_to admin_uploadcsv_path
	else
		flash[:error] = "Only CSV files are allowed."
		redirect_back(fallback_location: 'localhost:3000')
	end
end
content title: proc{ I18n.t("active_admin.dashboard") } do
	div class: "blank_slate_container", id: "dashboard_default_message" do
		span class: "blank_slate" do

		end
	end

    # Here is an example of a simple dashboard with columns and panels.
    #
    

    columns do
    	panel "File Upload" do

    		div do
    			render :partial => "admin/upload_csv/upload_csv"
    		end
    	end
    end


  end #

 # def upload
#logger.debug "#{@param}"
 # end

 
 # breadcrumb do
 # 	['admin', 'uploadcsv']
 # end
 # breadcrumb do
 #    [
 #      link_to('users', '/admin/users'),
 #      link_to('uploadcsv', '#')
 #    ]
 # end
end
