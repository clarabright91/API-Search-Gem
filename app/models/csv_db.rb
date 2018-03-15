require 'csv'
class CsvDb
  class << self
    # def convert_save(model_name, csv_data,parent_model_name)
    #   csv_file = csv_data.read

    #   CSV.parse(csv_file, headers: true) do |row|
    #     parent_target_model = parent_model_name.classify.constantize
    #     target_model = model_name.classify.constantize
    #     first_instance =parent_target_model.new(email: row["email"], password: row["password"])
    #     first_model_save = first_instance.save
    #     first_instance_id = first_instance.id
    #     if first_instance_id
    #       user_id = first_instance_id
    #     else 
    #       userInfo = parent_target_model.find_by email: row["email"]
    #       user_id = userInfo["id"]
    #     end
    #     data = target_model.new(post: row["post"], admin_user_id: user_id)
    #     second_save = data.save

    #   end
    # end

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
            elsif selected_model == 'Institution'
              Institution.create!(new_hash)
            elsif selected_model == 'Factual Mortgage companies'
              FactualMortgageCompany.create!(new_hash)
            elsif selected_model == 'Cities'
              City.create!(new_hash)
            elsif selected_model == 'FdicFamilyResidentialNetLoansAndLeases'    #import data from FDIC Reports Start
              FdicFamilyResidentialNetLoansAndLease.create!(new_hash)
            elsif selected_model == 'FdicAdditionalNonInterestExpense'
              FdicAdditionalNonInterestExpense.create!(new_hash)
            elsif selected_model == 'FdicAdditionalNonInterestIncome'
              FdicAdditionalNonInterestIncome.create!(new_hash)
            elsif selected_model == 'FdicAmountOfOwnershipSellerInterest'
              FdicAmountOfOwnershipSellerInterest.create!(new_hash)
            elsif selected_model == 'FdicAssetsAndLiability'
              FdicAssetsAndLiability.create!(new_hash)
            elsif selected_model == 'FdicBankAssetsSoldAndSecuritized'
              FdicBankAssetsSoldAndSecuritized.create!(new_hash)
            elsif selected_model == 'FdicCarryingAmountOfAssetsCoveredByFdicLossShareAgreement'
              FdicCarryingAmountOfAssetsCoveredByFdicLossShareAgreement.create!(new_hash)
            elsif selected_model == 'FdicCashAndBalancesDue'
              FdicCashAndBalancesDue.create!(new_hash)
            elsif selected_model == 'FdicCashDividend'
              FdicCashDividend.create!(new_hash)
            elsif selected_model == 'FdicChangesInBankEquityCapital'
              FdicChangesInBankEquityCapital.create!(new_hash)    
            elsif selected_model == 'FdicCollectiveInvestmentCommonTrustFund'
              FdicCollectiveInvestmentCommonTrustFund.create!(new_hash)
            elsif selected_model == 'FdicCorporateTrustAndAgencyAccount'
              FdicCorporateTrustAndAgencyAccount.create!(new_hash)
            elsif selected_model == 'FdicDepositsBasedOnTheDollar100000ReportingThreshold'
              FdicDepositsBasedOnTheDollar100000ReportingThreshold.create!(new_hash)
            elsif selected_model == 'FdicDepositsBasedOnTheDollar250000ReportingThreshold'
              FdicDepositsBasedOnTheDollar250000ReportingThreshold.create!(new_hash)
            elsif selected_model == 'FdicDepositsHeldInForeignOffice'
              FdicDepositsHeldInForeignOffice.create!(new_hash)
            elsif selected_model == 'FdicDerivative'
              FdicDerivative.create!(new_hash)
            elsif selected_model == 'FdicFiduciaryAndRelatedService'
              FdicFiduciaryAndRelatedService.create!(new_hash)
            elsif selected_model == 'FdicFiduciarySettlementsSurchargesAndOtherLoss'
              FdicFiduciarySettlementsSurchargesAndOtherLoss.create!(new_hash)
            elsif selected_model == 'FdicGoodwillAndOtherIntangible'
              FdicGoodwillAndOtherIntangible.create!(new_hash)
            elsif selected_model == 'FdicGrossFiduciaryAndRelatedServicesIncome'
              FdicGrossFiduciaryAndRelatedServicesIncome.create!(new_hash)
            elsif selected_model == 'FdicIncomeAndExpense'
              FdicIncomeAndExpense.create!(new_hash)
            elsif selected_model == 'FdicInterestIncomeAndExpenseInForeignOffice'
              FdicInterestIncomeAndExpenseInForeignOffice.create!(new_hash)
            elsif selected_model == 'FdicLettersOfCredit'
              FdicLettersOfCredit.create!(new_hash)
            elsif selected_model == 'FdicLoanChargeOffsAndRecovery'
              FdicLoanChargeOffsAndRecovery.create!(new_hash)
            elsif selected_model == 'FdicLoansRestructuredInTroubledDebtRestructuring'
              FdicLoansRestructuredInTroubledDebtRestructuring.create!(new_hash)
            elsif selected_model == 'FdicLoansToDepositoryInstitution'
              FdicLoansToDepositoryInstitution.create!(new_hash)
            elsif selected_model == 'FdicMaturityRepricingForLoansAndLease'
              FdicMaturityRepricingForLoansAndLease.create!(new_hash)
            elsif selected_model == 'FdicMaximumAmountOfCreditExposureRetained'
              FdicMaximumAmountOfCreditExposureRetained.create!(new_hash)
            elsif selected_model == 'FdicMemoranda'
              FdicMemoranda.create!(new_hash)
            elsif selected_model == 'FdicNetChargeOffs1To4FamilyResidential'
              FdicNetChargeOffs1To4FamilyResidential.create!(new_hash)
            elsif selected_model == 'FdicNetchargeOffsToLoan'
              FdicNetchargeOffsToLoan.create!(new_hash)
            elsif selected_model == 'FdicNetLoansAndLease'
              FdicNetLoansAndLease.create!(new_hash)
            elsif selected_model == 'FdicNonaccrual1To4FamilyResidential'
              FdicNonaccrual1To4FamilyResidential.create!(new_hash)
            elsif selected_model == 'FdicNoncurrentLoansToLoan'
              FdicNoncurrentLoansToLoan.create!(new_hash)
            elsif selected_model == 'FdicNonTransactionAccount'
              FdicNonTransactionAccount.create!(new_hash)              
            elsif selected_model == 'FdicNumberOfFiduciaryAndRelatedAssetAccount'
              FdicNumberOfFiduciaryAndRelatedAssetAccount.create!(new_hash)
            elsif selected_model == 'FdicOtherRealEstateOwned'
              FdicOtherRealEstateOwned.create!(new_hash)
            elsif selected_model == 'FdicPastDue30To89Days1To4FamilyResidential'
              FdicPastDue30To89Days1To4FamilyResidential.create!(new_hash)
            elsif selected_model == 'FdicPastDue90PlusDays1To4FamilyResidential'
              FdicPastDue90PlusDays1To4FamilyResidential.create!(new_hash)
            elsif selected_model == 'FdicPastDueAndNonaccrualAsset'
              FdicPastDueAndNonaccrualAsset.create!(new_hash)
            elsif selected_model == 'FdicPastDueNonaccrualLoansWhollyPartiallyUSGvmtGuaranteed'
              FdicPastDueNonaccrualLoansWhollyPartiallyGuaranteed.create!(new_hash) #model name was very long, unsupported by technology so model name trimmed 
            elsif selected_model == 'FdicPerformanceAndConditionRatio'
              FdicPerformanceAndConditionRatio.create!(new_hash)
            elsif selected_model == 'FdicSecurity'
              FdicSecurity.create!(new_hash)
            elsif selected_model == 'FdicSmallBusinessLoan'
              FdicSmallBusinessLoan.create!(new_hash)
            elsif selected_model == 'FdicTimeDepositsOfDollar100000OrMore'
              FdicTimeDepositsOfDollar100000OrMore.create!(new_hash)
            elsif selected_model == 'FdicTimeDepositsOfLessThanDollar100000'
              FdicTimeDepositsOfLessThanDollar100000.create!(new_hash)
            elsif selected_model == 'FdicTotalAssetsAndLiabilitiesInForeignOffice'
              FdicTotalAssetsAndLiabilitiesInForeignOffice.create!(new_hash)
            elsif selected_model == 'FdicTotalChargeOffs1To4FamilyResidential'
              FdicTotalChargeOffs1To4FamilyResidential.create!(new_hash)
            elsif selected_model == 'FdicTotalDebtSecurity'
              FdicTotalDebtSecurity.create!(new_hash)
            elsif selected_model == 'FdicTotalDeposit'
              FdicTotalDeposit.create!(new_hash)
            elsif selected_model == 'FdicTotalFiduciaryAndRelatedAsset'
              FdicTotalFiduciaryAndRelatedAsset.create!(new_hash)
            elsif selected_model == 'FdicTotalInterestExpense'
              FdicTotalInterestExpense.create!(new_hash)
            elsif selected_model == 'FdicTotalInterestIncome'
              FdicTotalInterestIncome.create!(new_hash)
            elsif selected_model == 'FdicTotalLoansAndLeasesInForeignOffice'
              FdicTotalLoansAndLeasesInForeignOffice.create!(new_hash)
            elsif selected_model == 'FdicTotalManagedAssetsHeldInFiduciaryAccount'
              FdicTotalManagedAssetsHeldInFiduciaryAccount.create!(new_hash)
            elsif selected_model == 'FdicTotalRecoveries1To4FamilyResidential'
              FdicTotalRecoveries1To4FamilyResidential.create!(new_hash)
            elsif selected_model == 'FdicTotalUnusedCommitment'
              FdicTotalUnusedCommitment.create!(new_hash)
            elsif selected_model == 'FdicTradingAccountGainsFee'
              FdicTradingAccountGainsFee.create!(new_hash)
            elsif selected_model == 'FdicTransactionAccount'
              FdicTransactionAccount.create!(new_hash)
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

    #def success_msg
      #return 'Data saved successfully.'
      #return true
    #end


  end
end

