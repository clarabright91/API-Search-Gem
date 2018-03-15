class CreateFdicMaturityRepricingForLoansAndLeases < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_maturity_repricing_for_loans_and_leases do |t|
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
      t.integer :lnls
      t.integer :lnrs3les
      t.integer :lnrs3t12
      t.integer :lnrs1t3
      t.integer :lnrs3t5
      t.integer :lnrs5t15
      t.integer :lnrsov15
      t.integer :lnot3les
      t.integer :lnot3t12
      t.integer :lnot1t3
      t.integer :lnot3t5
      t.integer :lnot5t15
      t.integer :lnotov15
      t.timestamps
    end
  end
end
