class CreateFdicTotalLoansAndLeasesInForeignOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_total_loans_and_leases_in_foreign_offices do |t|
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
      t.integer :lnlsgrf
      t.integer :unincfor
      t.integer :lnlsfor
      t.integer :lnrefor
      t.integer :idlndacf
      t.integer :lndepcbf
      t.integer :lndepusf
      t.integer :lndepfcf
      t.integer :lnagfor
      t.integer :lncifor
      t.integer :lncinusf
      t.integer :lnconfor
      t.integer :lnfgfor
      t.integer :lnmunif
      t.integer :lnotherf
      t.integer :lsfor
      t.timestamps
    end
  end
end
