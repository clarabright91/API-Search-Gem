=begin
  Developer:      Varun
  Created:        16-03-2018
  Purpose:        Following actions are for status update in admin panel .
=end
class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :update_statue, only: [:change_status, :user_mass_activate, :user_mass_deactivate]
 
  def index
		#render "index"
	end

  def show
    page = CmsPage.find_by(page_slug: params[:page_slug])
    if page
      @page = page
    else
       content_not_found  
    end
  end

  def refinance

  end

  def mortgage

  end  

  def contact_us_email
    @admin_user = AdminUser.first.email
    #ContactUsMailer.contact_us_email(@admin_user,params).deliver
    receivers  = ["ray@relativityteam.com", "tzewee@relativityteam.com", @admin_user]
      receivers.each do |rec|
        ContactUsMailer.contact_us_email(rec,params).deliver
      end
    flash[:notice] = 'Email sent successfully.'
    redirect_back fallback_location: root_path
	end

  def research_contact_us_email
    @admin_user = AdminUser.first.email
     receivers  = ["ray@relativityteam.com", "tzewee@relativityteam.com", @admin_user]
      receivers.each do |rec|
        if !params[:attachment].nil? && !params[:attachment].blank?
          file = params[:attachment].tempfile.path
          file_name = params[:attachment].original_filename
        else
          file = ""
          file_name = ""
        end           
        ResearchMailer.research_email(rec, params[:name], params[:email], params[:website], params[:research_summary],file_name,file).deliver
      end
    flash[:notice] = 'Research submitted successfully.'
    redirect_to buttercms_blog_path
  end


  def update_profile
    @user = User.find_by(id: params[:user][:id])
    @user.update_attributes(user_params)
    begin
     @user.save!
      flash[:notice]= 'Your account has been updated successfully.'
    rescue => e 
      flash[:danger]= "Your account has not updated because '#{e.message}'."
    end
      redirect_to edit_user_registration_path
  end

  def change_status
    @user.each do |usr|
      usr.update_attributes(is_active: !usr.is_active)
    end
    redirect_to admin_root_path, notice: "User #{@user.first.is_active ? "Activated" : "Dectivated"} Succesfully."
  end

  def user_mass_activate
    @user.each do |usr|
      usr.update(is_active: true)
     end
    redirect_to admin_root_path, notice: 'Selected Users Activated Succesfully.'
  end

  def user_mass_deactivate
    @user.each do |usr|
      usr.update(is_active: false)
     end
    redirect_to admin_root_path, notice: 'Selected Users Deactivated Succesfully.'
  end
  
  #Calling all the background workers for creating dynamic reports for city pages
  def city_freddie_cache_data
    FreddieMacCacheWorker.perform_async(["AK", "AL", "AR", "AZ", "CA", "CO"])
    FreddieMacCacheAWorker.perform_async(["CT", "DC", "DE", "FL", "GA", "HI"])
    FreddieMacCacheBWorker.perform_async(["IA", "ID", "IL", "IN", "KS"])
    FreddieMacCacheCWorker.perform_async(["KY", "LA", "MA", "MD", "ME"])
    FreddieMacCacheDWorker.perform_async(["MI", "MN", "MO", "MS", "MT"])
    FreddieMacCacheEWorker.perform_async(["NC", "ND", "NE", "NH", "NJ"])
    FreddieMacCacheFWorker.perform_async(["NM", "NV", "NY", "OH", "OK"])
    FreddieMacCacheGWorker.perform_async(["OR", "PA", "PR", "RI", "SC"])
    FreddieMacCacheHWorker.perform_async(["SD", "TN", "TX", "UT", "VA"])
    FreddieMacCacheIWorker.perform_async(["VT", "WA", "WI", "WV", "WY"])
    redirect_to admin_freddie_mac_caches_path, notice: 'Data Cache start for Cities.'  
  end   

  private
    def update_statue
      all_ids = params[:id].reject{|a| a.blank?}
      @user = User.find(all_ids)
    end  
    
    def user_params
        params.require(:user).permit(:id,:first_name,:last_name,:email,:phone_number,:zip_code,:purpose, :home_price, :down_payment, :credit_score,:password, :password_confirmation, :current_password,:price_alert)
    end 
end
