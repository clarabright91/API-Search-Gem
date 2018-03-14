class CreateFdicDerivatives < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_derivatives do |t|
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
      t.integer :obsdir, limit: 8
      t.integer :idctder, limit: 8
      t.integer :ctdergty, limit: 8
      t.integer :ctderben, limit: 8
      t.integer :rt, limit: 8
      t.integer :rtnvs, limit: 8
      t.integer :rtffc, limit: 8
      t.integer :rtwoc, limit: 8
      t.integer :rtpoc, limit: 8
      t.integer :fx, limit: 8
      t.integer :fxnvs, limit: 8
      t.integer :fxffc, limit: 8
      t.integer :fxspot, limit: 8
      t.integer :fxwoc, limit: 8
      t.integer :fxpoc, limit: 8
      t.integer :edcm, limit: 8
      t.integer :othnvs, limit: 8
      t.integer :othffc, limit: 8
      t.integer :othwoc
      t.integer :othpoc
      t.timestamps
    end
  end
end
