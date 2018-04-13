class FdicInstitution < ApplicationRecord
  #validates :stname,:cert,:docket,:active,:address,:asset,:bkclass,:changec1,:changec2,:changec3,:changec4,:changec5,:charter,:chrtagnt,:conserve,:city,:clcode,:cmsa_no,:county,:dateupdt,:denovo,:dep,:effdate,:endefymd,:estymd,:fdicdbs,:fdicregn,:fdicsupv,:fed,:fed_rssd,:fedchrtr,:fldoff,:iba,:inactive,:insagnt1,:insdate,:instcrcd,:insbif,:inscoml,:insdif,:insfdic,:inssaif,:inssave,:msa_no,:name,:newcert,:oakar,:otsdist,:otsregnm,:procdate,:qbprcoml,:regagnt,:repdte,:risdate,:stchrtr,:rundate,:sasser,:law_sasser_flg,:stalp,:stcnty,:stnum,:zip,:suprv_fd,:occdist,:uninum,:ultcert,:offices,:csa_flg,:cbsa_no,:cbsa_metro,:cbsa_metro_flg,:cbsa_micro_flg,:cbsa_div_no,:cbsa_div_flg, presence: true

  #search term for finding banks
  def self.search_term(column, prefix)
    where("lower(#{column}) like ?", "#{prefix.downcase}%").sort_by(&:name).pluck(:name).first(30)
  end

  def self.search_term_next(column, prefix, last_bank_id)
    where("lower(#{column}) like ? AND name > ?", "#{prefix.downcase}%", last_bank_id).pluck(:name).sort.first(30)  
  end

end
