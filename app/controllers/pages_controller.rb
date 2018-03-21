class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :update_statue, only: [:change_status, :user_mass_activate, :user_mass_deactivate]

  def index
		render "index"
	end

  def show
    @page = CmsPage.find(params[:id])
  end

  def contact_us_email
    @admin_user = AdminUser.first.email
    ContactUsMailer.contact_us_email(@admin_user,params).deliver
		respond_to do |format|
	    format.js
	    format.html
	  end
	end

=begin
  Developer:      Varun
  Created:        16-03-2018
  Purpose:        Following actions are for status update in admin panel .
=end
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
end
