class CreateFdicCalculations < ActiveRecord::Migration[5.1]
  def change
    create_table :fdic_calculations do |t|
      t.integer :cert, index: { unique: true }
      t.float :m_idscod
      t.float :m_sccmmb
      t.float :m_scmtgbk
      t.float :m_idscgtpc
      t.float :m_idsccmo
      t.float :m_idsccmt
      t.float :m_sccmpt
      t.float :m_sccmot
      t.float :m_sccptg
      t.float :m_intanmsr
      t.float :m_intangcc
      t.float :m_tpiremtg
      t.float :m_teremtg
      t.float :m_toremtg
      t.float :m_lnlsgr
      t.float :m_lnre
      t.float :p_p3conoth
      t.float :p_p9conoth
      t.float :p_naconoth
      t.float :p_lcon
      t.float :p_p3lcon
      t.float :p_p9lcon
      t.float :p_nalcon
      t.float :p_szlncon
      t.float :p_sz30con
      t.float :p_sz90con
      t.float :p_szdrcon
      t.float :p_szcrcon
      t.float :p_asdrcons
      t.float :p_sziocon
      t.float :p_szssccon
      t.float :p_idslccon
      t.float :p_encecon
      t.float :p_ascecons
      t.float :p_szuccon
      t.float :p_ucszcon
      t.float :p_drconoth
      t.float :p_crconoth
      t.float :p_ntconoth
      t.float :a_lnauto
      t.float :a_p3auto
      t.float :a_p9auto
      t.float :a_naauto
      t.float :a_szlauto
      t.float :a_sz30auto
      t.float :a_sz90auto
      t.float :a_szdrauto
      t.float :a_sz90auto
      t.float :a_asdrauto
      t.float :a_szioauto
      t.float :a_szsscaut
      t.float :a_idslcaut
      t.float :a_enceauto
      t.float :a_asceauto
      t.float :a_szucauto
      t.float :a_ucszauto
      t.float :a_drauto
      t.float :a_crauto
      t.float :a_ntauto
      t.float :a_lnlsgr
      t.timestamps
    end
  end
end
