class CreateFdicLoanChargeOffsAndRecoveries < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_loan_charge_offs_and_recoveries do |t|
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
      t.integer :drlnls
      t.integer :drre
      t.integer :drrenus
      t.integer :iddrredm
      t.integer :drrecons
      t.integer :drrecnfm
      t.integer :drrecnot
      t.integer :drreag
      t.integer :drreres
      t.integer :drremult
      t.integer :drrenres
      t.integer :drrenrow
      t.integer :drrenrot
      t.integer :drrefor
      t.integer :drdep
      t.integer :drdepnus
      t.integer :drag
      t.integer :drci
      t.integer :drcon
      t.integer :drcrcd
      t.integer :drauto
      t.integer :drconoth
      t.integer :drforgv
      t.integer :drother
      t.integer :drls
      t.integer :dragsm
      t.integer :crlnls
      t.integer :crre
      t.integer :crrenus
      t.integer :idcrredm
      t.integer :crrecons
      t.integer :crrecnfm
      t.integer :crrecnot
      t.integer :crreag
      t.integer :crreres
      t.integer :crremult
      t.integer :crrenres
      t.integer :crrenrow
      t.integer :crrenrot
      t.integer :crrefor
      t.integer :crdep
      t.integer :crdepnus
      t.integer :crag
      t.integer :crci
      t.integer :crcon
      t.integer :crcrcd
      t.integer :crauto
      t.integer :crconoth
      t.integer :crforgv
      t.integer :crother
      t.integer :crls
      t.integer :cragsm
      t.integer :ntlnls
      t.integer :ntre
      t.integer :ntrenus
      t.integer :idntredm
      t.integer :ntrecons
      t.integer :ntrecnfm
      t.integer :ntrecnot
      t.integer :ntreag
      t.integer :ntreres
      t.integer :ntremult
      t.integer :ntrenres
      t.integer :ntrenrow
      t.integer :ntrenrot
      t.integer :ntrefor
      t.integer :ntdep
      t.integer :ntdepnus
      t.integer :ntag
      t.integer :ntci
      t.integer :ntcinus
      t.integer :ntcon
      t.integer :ntcrcd
      t.integer :ntauto
      t.integer :ntconoth
      t.integer :ntforgv
      t.integer :ntother
      t.integer :ntls
      t.integer :ntagsm

      t.timestamps
    end
  end
end
