class CreateFdicGrossFiduciaryAndRelatedServicesIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_gross_fiduciary_and_related_services_incomes do |t|
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
      t.integer :trpower
      t.integer :trexer
      t.integer :tract
      t.integer :tip
      t.integer :tiec
      t.integer :tieb
      t.integer :tior
      t.integer :tica
      t.integer :tima
      t.integer :tife
      t.integer :tiof
      t.integer :tics
      t.integer :tir
      t.integer :ifiduc
      t.integer :tetot
      t.integer :tnl
      t.integer :tintra
      t.integer :tni
      t.integer :titotf
      t.timestamps
    end
  end
end
