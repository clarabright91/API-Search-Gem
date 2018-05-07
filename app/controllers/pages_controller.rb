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
    @page = CmsPage.find(params[:id])
  end

  def refinance

  end

  def contact_us_email
    @admin_user = AdminUser.first.email
    ContactUsMailer.contact_us_email(@admin_user,params).deliver
    flash[:notice] = 'Email sent successfully.'
    redirect_back fallback_location: root_path
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

  private
    def update_statue
      all_ids = params[:id].reject{|a| a.blank?}
      @user = User.find(all_ids)
    end  
    
    def user_params
        params.require(:user).permit(:id,:first_name,:last_name,:email,:phone_number,:zip_code,:purpose, :home_price, :down_payment, :credit_score,:password, :password_confirmation, :current_password,:price_alert)
    end 
end
