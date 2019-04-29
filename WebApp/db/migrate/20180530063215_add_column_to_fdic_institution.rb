class AddColumnToFdicInstitution < ActiveRecord::Migration[5.1]
  def change
    add_column  :fdic_institutions, :used, :boolean
  end
end
