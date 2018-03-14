class CreateFdicPastDueNonaccrualLoansWhollyPartiallyGuaranteeds < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_past_due_nonaccrual_loans_wholly_partially_guaranteeds do |t|
      t.integer :cert
      t.integer :docket
      t.integer :fed_rssd
      t.integer :rssdhcr
      t.string :name
      t.string :city
      t.string :stalp
      t.integer :zip
      t.string :repdte
      t.string :rundate
      t.string :bkclass
      t.string :address
      t.string :namehcr
      t.integer :offdom
      t.integer :offfor
      t.integer :stmult
      t.integer :specgrp
      t.integer :subchaps
      t.string :county
      t.integer :cbsa_metro
      t.string :cbsa_metro_name
      t.string :estymd
      t.string :insdate
      t.string :effdate
      t.string :mutual
      t.integer :parcert
      t.integer :trust
      t.string :regagnt
      t.string :insagnt1
      t.string :fdicdbs
      t.string :fdicsupv
      t.string :fldoff
      t.string :fed
      t.string :occdist
      t.string :otsregnm
      t.integer :offoa
      t.integer :cb
      t.string :inst_webaddr
      t.integer :p3gtypar
      t.integer :p3gty
      t.integer :p3gtygnm
      t.integer :p9gtypar
      t.integer :p9gty
      t.integer :p9gtygnm
      t.integer :nagtypar
      t.integer :nagty
      t.integer :nagtygnm
      t.timestamps
    end
  end
end
