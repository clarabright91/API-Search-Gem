class AddColumnToFdicCalculation < ActiveRecord::Migration[5.1]
  def change
    add_column :fdic_calculations, :a_szcrauto, :float
  end
end
