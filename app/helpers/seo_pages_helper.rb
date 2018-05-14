module SeoPagesHelper

  def remove_unnecessary_keywords(arg)
    return arg.gsub('�', ' ')  if arg.present?
  end  

  #Mortgage Rates
  # def historial_rates_report(state_code)
  #   main_hash = {}
  #   (Date.today.year-9..Date.today.year-1).each do |year|
  #     date = DateTime.new(year)
  #     year_start = date.beginning_of_year
  #     year_end = date.end_of_year
      
  #     FreddieMacLoanOrigination.where("first_payment_date >= ? and first_payment_date <= ?", year_start, year_end)
      

  #    end 
  # end


end
