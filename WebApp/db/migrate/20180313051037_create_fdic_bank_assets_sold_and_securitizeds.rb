class CreateFdicBankAssetsSoldAndSecuritizeds < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_bank_assets_sold_and_securitizeds do |t|
      t.integer :cert, index: true
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
      t.integer :szlnres
      t.integer :szlnhel
      t.integer :szlncrcd
      t.integer :szlauto
      t.integer :szlncon
      t.integer :szlnci
      t.integer :szlnoth
      t.integer :sz30res
      t.integer :sz30hel
      t.integer :sz30crcd
      t.integer :sz30auto
      t.integer :sz30con
      t.integer :sz30ci
      t.integer :sz30oth
      t.integer :sz90res
      t.integer :sz90hel
      t.integer :sz90crcd
      t.integer :sz90auto
      t.integer :sz90con
      t.integer :sz90ci
      t.integer :sz90oth
      t.integer :szdrres
      t.integer :szdrhel
      t.integer :szdrcrcd
      t.integer :szdrauto
      t.integer :szdrcon
      t.integer :szdrci
      t.integer :szdroth
      t.integer :szcrres
      t.integer :szcrhel
      t.integer :szcrcrcd
      t.integer :szcrauto
      t.integer :szcrcon
      t.integer :szcrci
      t.integer :szcroth
      t.integer :asdrres
      t.integer :asdrhel
      t.integer :asdrcrcd
      t.integer :asdrauto
      t.integer :asdrcons
      t.integer :asdrci
      t.integer :asdroth
      t.timestamps
    end
  end
end
