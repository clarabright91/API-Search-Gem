class CreateFdicMaximumAmountOfCreditExposureRetaineds < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_maximum_amount_of_credit_exposure_retaineds do |t|
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
      t.integer :sziores
      t.integer :sziohel
      t.integer :sziocrcd
      t.integer :szioauto
      t.integer :sziocon
      t.integer :szioci
      t.integer :sziooth
      t.integer :szsscres
      t.integer :szsschel
      t.integer :szssccrd
      t.integer :szsscaut
      t.integer :szssccon
      t.integer :szsscci
      t.integer :szsscoth
      t.integer :idslcres
      t.integer :idslchel
      t.integer :idslcccd
      t.integer :idslcaut
      t.integer :idslccon
      t.integer :idslccci
      t.integer :idslcoth
      t.integer :enceres
      t.integer :encehel
      t.integer :encecrcd
      t.integer :enceauto
      t.integer :encecon
      t.integer :enceci
      t.integer :enceoth
      t.integer :asceres
      t.integer :ascehel
      t.integer :ascecrcd
      t.integer :asceauto
      t.integer :ascecons
      t.integer :asceci
      t.integer :asceoth
      t.timestamps
    end
  end
end
