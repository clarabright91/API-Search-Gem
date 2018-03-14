ActiveAdmin.register Institution do
  permit_params :stname,:cert,:docket,:active,:address,:asset,:bkclass,:changec1,:changec2,:changec3,:changec4,:changec5,:charter,:chrtagnt,:conserve,:city,:clcode,:cmsa_no,:cmsa,:county,:dateupdt,:denovo,:dep,:effdate,:endefymd,:eq,:estymd,:fdicdbs,:fdicregn,:fdicsupv,:fed,:fed_rssd,:fedchrtr,:fldoff,:iba,:inactive,:insagnt1,:insagnt2,:insdate,:instcrcd,:insbif,:inscoml,:insdif,:insfdic,:inssaif,:inssave,:msa_no,:msa,:name,:newcert,:oakar,:otsdist,:otsregnm,:procdate,:qbprcoml,:regagnt,:repdte,:risdate,:stchrtr,:roa,:roaq,:roe,:roeq,:rundate,:sasser,:law_sasser_flg,:stalp,:stcnty,:stnum,:webaddr,:zip,:suprv_fd,:occdist,:uninum,:ultcert,:cfpbeffdte,:cfpbenddte,:regagent2,:offices,:certcons,:parcert,:cityhcr,:depdom,:form31,:hctmult,:instag,:mutual,:namehcr,:netinc,:netincq,:offdom,:offfor,:offoa,:rssdhcr,:stalphcr,:stmult,:subchaps,:roaptx,:roaptxq,:trust,:specgrp,:specgrpn,:tract,:csa,:csa_no,:csa_flg,:cbsa,:cbsa_no,:cbsa_metro_name,:cbsa_metro,:cbsa_metro_flg,:cbsa_micro_flg,:cbsa_div,:cbsa_div_no,:cbsa_div_flg,:cb

  index do
    selectable_column
    id_column
    column :address
    column :city
    column :stname
    column :zip
    column :created_at
    actions
  end

  filter :address
  filter :city
  filter :stname
  filter :zip
  filter :created_at  


  form do |f|
    f.inputs 'Institution' do
      f.input :stname
      f.input :cert
      f.input :docket
      f.input :active
      f.input :address
      f.input :asset
      f.input :bkclass
      f.input :changec1
      f.input :changec2
      f.input :changec3
      f.input :changec4
      f.input :changec5
      f.input :charter
      f.input :chrtagnt
      f.input :conserve
      f.input :city
      f.input :clcode
      f.input :cmsa_no
      f.input :cmsa
      f.input :county
      f.input :dateupdt
      f.input :denovo
      f.input :dep
      f.input :effdate
      f.input :endefymd
      f.input :eq
      f.input :estymd
      f.input :fdicdbs
      f.input :fdicregn
      f.input :fdicsupv
      f.input :fed
      f.input :fed_rssd
      f.input :fedchrtr
      f.input :fldoff
      f.input :iba
      f.input :inactive
      f.input :insagnt1
      f.input :insagnt2
      f.input :insdate
      f.input :instcrcd
      f.input :insbif
      f.input :inscoml
      f.input :insdif
      f.input :insfdic
      f.input :inssaif
      f.input :inssave
      f.input :msa_no
      f.input :msa
      f.input :name
      f.input :newcert
      f.input :oakar
      f.input :otsdist
      f.input :otsregnm
      f.input :procdate
      f.input :qbprcoml
      f.input :regagnt
      f.input :repdte
      f.input :risdate
      f.input :stchrtr
      f.input :roa
      f.input :roaq
      f.input :roe
      f.input :roeq
      f.input :rundate
      f.input :sasser
      f.input :law_sasser_flg
      f.input :stalp
      f.input :stcnty
      f.input :stnum
      f.input :webaddr
      f.input :zip
      f.input :suprv_fd
      f.input :occdist
      f.input :uninum
      f.input :ultcert
      f.input :cfpbeffdte
      f.input :cfpbenddte
      f.input :regagent2
      f.input :offices
      f.input :certcons
      f.input :parcert
      f.input :cityhcr
      f.input :depdom
      f.input :form31
      f.input :hctmult
      f.input :instag
      f.input :mutual
      f.input :namehcr
      f.input :netinc
      f.input :netincq
      f.input :offdom
      f.input :offfor
      f.input :offoa
      f.input :rssdhcr
      f.input :stalphcr
      f.input :stmult
      f.input :subchaps
      f.input :roaptx
      f.input :roaptxq
      f.input :trust
      f.input :specgrp
      f.input :specgrpn
      f.input :tract
      f.input :csa
      f.input :csa_no
      f.input :csa_flg
      f.input :cbsa
      f.input :cbsa_no
      f.input :cbsa_metro_name
      f.input :cbsa_metro
      f.input :cbsa_metro_flg
      f.input :cbsa_micro_flg
      f.input :cbsa_div
      f.input :cbsa_div_no
      f.input :cbsa_div_flg
      f.input :cb
    
    end

    f.actions
  end

end
