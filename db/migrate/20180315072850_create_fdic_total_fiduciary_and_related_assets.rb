class CreateFdicTotalFiduciaryAndRelatedAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_total_fiduciary_and_related_assets do |t|
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
      t.integer :trpower, limit: 8
      t.integer :trexer, limit: 8
      t.integer :tract, limit: 8
      t.integer :idtfra, limit: 8
      t.integer :ttma, limit: 8
      t.integer :tpma, limit: 8
      t.integer :tecma
      t.integer :tebma
      t.integer :torma
      t.integer :tcama
      t.integer :timma
      t.integer :tfema
      t.integer :tofma
      t.integer :tmaf
      t.integer :trhma
      t.integer :tmasmf
      t.integer :ttnma, limit: 8
      t.integer :tpnma
      t.integer :tecnma
      t.integer :tebnma, limit: 8
      t.integer :tornma
      t.integer :tcanma
      t.integer :timnma
      t.integer :tfenma
      t.integer :tofnma
      t.integer :tcsnma, limit: 8
      t.integer :tnmaf, limit: 8
      t.integer :trhnma
      t.timestamps
    end
  end
end
