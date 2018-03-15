class CreateFdicTotalDebtSecurities < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_total_debt_securities do |t|
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
      t.integer :scrdebt
      t.integer :scpt3les
      t.integer :scpt3t12
      t.integer :scpt1t3
      t.integer :scpt3t5
      t.integer :scpt5t15
      t.integer :scptov15
      t.integer :sco3yles
      t.integer :scoov3y
      t.integer :scnm3les
      t.integer :scnm3t12
      t.integer :scnm1t3
      t.integer :scnm3t5
      t.integer :scnm5t15
      t.integer :scnmov15
      t.integer :sc1les
      t.timestamps
    end
  end
end
