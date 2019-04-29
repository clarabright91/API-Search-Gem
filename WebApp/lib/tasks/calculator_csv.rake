namespace :calculator_csv do

 desc "Import CSV File for Calculator"
 task import_calculator_csv: :environment do
   puts "Import CSV File for Calculator"
   CalculatorPropertyTax.calculator_import_csv_file
   puts "done."
 end

end
