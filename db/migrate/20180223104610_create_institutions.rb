class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :stname
      t.string :cert
      t.string :docket
      t.string :active
      t.string :address
      t.string :asset
      t.string :bkclass
      t.string :changec1
      t.string :changec2
      t.string :changec3
      t.string :changec4
      t.string :changec5
      t.string :charter
      t.string :chrtagnt
      t.string :conserve
      t.string :city
      t.string :clcode
      t.string :cmsa_no
      t.string :cmsa
      t.string :county
      t.string :dateupdt
      t.string :denovo
      t.string :dep
      t.string :effdate
      t.string :endefymd
      t.string :eq
      t.string :estymd
      t.string :fdicdbs
      t.string :fdicregn
      t.string :fdicsupv
      t.string :fed
      t.string :fed_rssd
      t.string :fedchrtr
      t.string :fldoff
      t.string :iba
      t.string :inactive
      t.string :insagnt1
      t.string :insagnt2
      t.string :insdate
      t.string :instcrcd
      t.string :insbif
      t.string :inscoml
      t.string :insdif
      t.string :insfdic
      t.string :inssaif
      t.string :inssave
      t.string :msa_no
      t.string :msa
      t.string :name
      t.string :newcert
      t.string :oakar
      t.string :otsdist
      t.string :otsregnm
      t.string :procdate
      t.string :qbprcoml
      t.string :regagnt
      t.string :repdte
      t.string :risdate
      t.string :stchrtr
      t.string :roa
      t.string :roaq
      t.string :roe
      t.string :roeq
      t.string :rundate
      t.string :sasser
      t.string :law_sasser_flg
      t.string :stalp
      t.string :stcnty
      t.string :stnum
      t.string :webaddr
      t.string :zip
      t.string :suprv_fd
      t.string :occdist
      t.string :uninum
      t.string :ultcert
      t.string :cfpbeffdte
      t.string :cfpbenddte
      t.string :regagent2
      t.string :offices
      t.string :certcons
      t.string :parcert
      t.string :cityhcr
      t.string :depdom
      t.string :form31
      t.string :hctmult
      t.string :instag
      t.string :mutual
      t.string :namehcr
      t.string :netinc
      t.string :netincq
      t.string :offdom
      t.string :offfor
      t.string :offoa
      t.string :rssdhcr
      t.string :stalphcr
      t.string :stmult
      t.string :subchaps
      t.string :roaptx
      t.string :roaptxq
      t.string :trust
      t.string :specgrp
      t.string :specgrpn
      t.string :tract
      t.string :csa
      t.string :csa_no
      t.string :csa_flg
      t.string :cbsa
      t.string :cbsa_no
      t.string :cbsa_metro_name
      t.string :cbsa_metro
      t.string :cbsa_metro_flg
      t.string :cbsa_micro_flg
      t.string :cbsa_div
      t.string :cbsa_div_no
      t.string :cbsa_div_flg
      t.string :cb
      t.timestamps
    end
  end
end
