class FdicInstitution < ApplicationRecord
  #validates :stname,:cert,:docket,:active,:address,:asset,:bkclass,:changec1,:changec2,:changec3,:changec4,:changec5,:charter,:chrtagnt,:conserve,:city,:clcode,:cmsa_no,:county,:dateupdt,:denovo,:dep,:effdate,:endefymd,:estymd,:fdicdbs,:fdicregn,:fdicsupv,:fed,:fed_rssd,:fedchrtr,:fldoff,:iba,:inactive,:insagnt1,:insdate,:instcrcd,:insbif,:inscoml,:insdif,:insfdic,:inssaif,:inssave,:msa_no,:name,:newcert,:oakar,:otsdist,:otsregnm,:procdate,:qbprcoml,:regagnt,:repdte,:risdate,:stchrtr,:rundate,:sasser,:law_sasser_flg,:stalp,:stcnty,:stnum,:zip,:suprv_fd,:occdist,:uninum,:ultcert,:offices,:csa_flg,:cbsa_no,:cbsa_metro,:cbsa_metro_flg,:cbsa_micro_flg,:cbsa_div_no,:cbsa_div_flg, presence: true

  def self.search_term(prefix)
    where("lower(name) like ?", "#{prefix.downcase}%").sort_by(&:name)
  end
  
  def self.banks_list(alphabet, start_bank_id, last_bank_id)
    begin
      all_banks = search_term(alphabet)
       s_bank = all_banks.index(find(start_bank_id))
       l_bank = all_banks.index(find(last_bank_id))
      return all_banks[s_bank..l_bank]
    rescue
      return false
    end        
  end  

  def self.search_term_special
    where("name !~ ?", "^[A-Za-z]").sort_by(&:name)
  end

  def self.banks_list_special(start_bank_id, last_bank_id)
    begin
      all_banks = search_term_special
       s_bank = all_banks.index(find(start_bank_id))
       l_bank = all_banks.index(find(last_bank_id))
      return all_banks[s_bank..l_bank]
    rescue
      return false
    end  
  end

  def self.near_by_banks(cert)
    first_two_banks = FdicInstitution.where('cert > ?', cert).limit(2)
    last_three_banks = FdicInstitution.where('cert < ?', cert).limit(3)
    return first_two_banks + last_three_banks
  end

end
