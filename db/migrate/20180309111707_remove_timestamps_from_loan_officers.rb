class RemoveTimestampsFromLoanOfficers < ActiveRecord::Migration[5.1]
  def change
    change_column :loan_officers,:created_at, 'timestamp USING CAST(created_at AS timestamp)'
    change_column :loan_officers, :updated_at, 'timestamp USING CAST(updated_at AS timestamp)'
  end
end
