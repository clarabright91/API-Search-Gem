class CreateFdicDepositsBasedOnTheDollar250000ReportingThresholds < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_deposits_based_on_the_dollar250000_reporting_thresholds do |t|
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
      t.integer  :trust
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
      t.integer :iddepsam
      t.integer :iddepsmb
      t.integer :depsmra
      t.integer :depsmrn
      t.integer :ntrcdsmj
      t.integer :iddeplam
      t.integer :iddeplgb
      t.integer :deplgra
      t.integer :deplgrn
      t.integer :trnnia
      t.integer :trnnin
      t.integer :ntrtmlgj
      t.timestamps
    end
  end
end
