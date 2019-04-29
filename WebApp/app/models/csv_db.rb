require 'csv'
class CsvDb
  class << self
    def convert_save(csv_data, selected_model)        #Function to import data from Csv file
      begin                                           #Exception Handling
        file = csv_data
          CSV.foreach(file.path, headers: true) do |row|
            new_hash = {}
                row.to_hash.delete_if{|k, v| k.nil?}.each_pair do |k,v|   # removing nil keys
                 new_hash.merge!({k.downcase => v})    # converting keys into downcase to map database columns
                end
            if selected_model == 'LoanOfficer'
              LoanOfficer.create!(new_hash)
            elsif selected_model == 'FdicInstitution'
              FdicInstitution.create!(new_hash)
            elsif selected_model == 'FactualMortgageCompany'
              FactualMortgageCompany.create!(new_hash)
            elsif selected_model == 'City'
              City.create!(new_hash)
            elsif selected_model == 'FdicBankAssetsSoldAndSecuritized'
              FdicBankAssetsSoldAndSecuritized.create!(new_hash)
            elsif selected_model == 'FdicCarryingAmountOfAssetsCoveredByFdicLossShareAgreement'
              FdicCarryingAmountOfAssetsCoveredByFdicLossShareAgreement.create!(new_hash)
            elsif selected_model == 'FdicGoodwillAndOtherIntangible'
              FdicGoodwillAndOtherIntangible.create!(new_hash)
            elsif selected_model == 'FdicLoanChargeOffsAndRecovery'
              FdicLoanChargeOffsAndRecovery.create!(new_hash)
            elsif selected_model == 'FdicMaximumAmountOfCreditExposureRetained'
              FdicMaximumAmountOfCreditExposureRetained.create!(new_hash)
            elsif selected_model == 'FdicNetLoansAndLease'
              FdicNetLoansAndLease.create!(new_hash)
            elsif selected_model == 'FdicPastDueAndNonaccrualAsset'
              FdicPastDueAndNonaccrualAsset.create!(new_hash)
            elsif selected_model == 'FdicSecurity'
              FdicSecurity.create!(new_hash)
            elsif selected_model == 'FdicTotalManagedAssetsHeldInFiduciaryAccount'
              FdicTotalManagedAssetsHeldInFiduciaryAccount.create!(new_hash)
            elsif selected_model == 'FdicTotalUnusedCommitment'
              FdicTotalUnusedCommitment.create!(new_hash)
            elsif selected_model == 'FdicUsGovernmentObligation'
              FdicUsGovernmentObligation.create!(new_hash)
            elsif selected_model == 'FdicUnusedCommitment'
              FdicUnusedCommitment.create!(new_hash)            #import data from FDIC Reports end
            else
              return false
            end
          end
          return true
      rescue => e
          #e.message.to_s
          return false
      end
    end
  end
end
