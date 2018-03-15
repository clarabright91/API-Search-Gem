class LoanOfficersController < ApplicationController
  require 'csv'

  def index
    @officers = LoanOfficer.all
  end

  def import
    begin
     file = params[:file]
        CSV.foreach(file.path, headers: true) do |row|
          new_hash = {}
              row.to_hash.delete_if{|k, v| k.nil?}.each_pair do |k,v| 
               new_hash.merge!({k.downcase => v}) 
              end
          #new_hash= new_hash.compact #skipping nil fields 
          LoanOfficer.create!(new_hash)
        end
      redirect_to root_url, notice: "Imported Successfully."
    rescue
      redirect_to root_url, notice: "Invalid CSV file format."
    end
  end

end
