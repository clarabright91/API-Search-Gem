class CreateFdicNoncurrentLoansToLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_noncurrent_loans_to_loans do |t|
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
      t.string :webaddr
      t.float :nclnlsr
      t.float :ncrer
      t.float :ncreconr
      t.float :ncrenrer
      t.float :ncremulr
      t.float :ncreresr
      t.float :ncrelocr
      t.float :ncrereor
      t.float :idnccir
      t.float :idncconr
      t.float :idnccrdr
      t.float :idnccoor
      t.float :idncothr
      t.float :nccomrer
      t.float :idncgtpr
      t.timestamps
    end
  end
end
