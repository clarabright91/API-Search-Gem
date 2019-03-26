class CalculatorController < ApplicationController
  before_action :load_default

  def index
    if(params[:commit].present? || params["monthly_property_tax"].present?)
      set_variables
    end

    set_property_tax_and_home_insurance_and_price_to_rent_ratio_by_zip_code
    calculate_loan_payment
    number_of_payments
    set_default_pmi_insurance
    monthly_interest_rate
    calculate_discount_factor
    calculate_monthly_payment
    calculate_monthly_property_tax
    calculate_pmi_term
    monthly_expenses_breakdown
    monthly_payoff_schedule
    monthly_payoff_schedule_graph
    investment_return_from_ownership
    set_affordability_chart_data
    # render :index
  end

  def get_todays_rate
    today_rate_hash = {"10" =>"4.0", "15" =>"4.2", "20" =>"4.5", "25" =>"4.8", "30" =>"5.0"}
    today_rate = '4.0'
    if params[:mortgage_term].present?
      today_rate = today_rate_hash[params[:mortgage_term]]
    end
    render json: {today_rate: today_rate}
  end

  def calculate_monthly_payment
    monthly_pay = (calculate_loan_payment/calculate_discount_factor) rescue 0.0
    monthly_pay = 0.0 if (monthly_pay.nan? || monthly_pay.infinite?)
    return monthly_pay
  end

  def investment_return_from_ownership
    @initial_costs = {}
    @recuring_costs = {}
    @closing_costs = {}
    @home_appreciation = {}
    @costs_compare_sum = {}

    @rent_security_deposit = (@home_price/(12*@price_to_rent_ratio))*-1
    @costs_of_buying_house = {}
    @costs_of_buying_house[:rent] = (@home_price/(12*@price_to_rent_ratio)*0.25)*-1
    @costs_of_buying_house[:buy] = (@home_price*0.02467)*-1

    @initial_costs[:rent] = (@home_price/(12*@price_to_rent_ratio))*-1 + (@home_price/(12*@price_to_rent_ratio)*0.25)*-1
    @initial_costs[:buy] = @down_payment*-1 + (@home_price*0.02467)*-1

    @recuring_costs[:rent] = (@home_price/@price_to_rent_ratio*@mortgage_term*(1+0.025)**@mortgage_term+@home_price/@price_to_rent_ratio*@mortgage_term*0.0132)*-1

    @recuring_costs[:buy] = 
    ((@mortgage_principal[:total] + @mortgage_interest[:total])*-1) + (@property_tax[:total]*-1) + (@home_insurance[:total]*-1) + (@pmi_insurance[:total]*-1) + ((((1+0.054/12)**number_of_payments-1)*@down_payment)*-1)

    @total_monthly_rents = (@home_price/@price_to_rent_ratio*@mortgage_term*(1+0.025)**@mortgage_term)
    @mortgage_payments = (@mortgage_principal[:total] + @mortgage_interest[:total])*-1
    @renter_insurance = (@home_price/@price_to_rent_ratio*@mortgage_term*0.0132)*-1
    @returns_for_investment = ((((1+0.054/12)**number_of_payments-1)*@down_payment)*-1)

    @closing_costs[:rent] = 0.0
    @closing_costs[:buy] = (@home_price*0.03)*-1

    @home_appreciation[:rent] = @initial_costs[:rent]*-1
    @home_appreciation[:buy] = @home_price*(1.054)**@mortgage_term*0.85

    @costs_compare_sum[:rent] =(@initial_costs[:rent] + @recuring_costs[:rent] + @closing_costs[:rent] + @home_appreciation[:rent])
    @costs_compare_sum[:buy] = @initial_costs[:buy] + @recuring_costs[:buy] + @closing_costs[:buy] + @home_appreciation[:buy]

    if (calculate_loan_payment<=750000)
      @mortgage_interest_deduction = (calculate_monthly_payment*number_of_payments-calculate_loan_payment)/@mortgage_term
    else
      @mortgage_interest_deduction = ((calculate_monthly_payment*number_of_payments-calculate_loan_payment)/@mortgage_term)*750000/calculate_loan_payment
    end

    if (@costs_compare_sum[:buy].abs <=0)
       @costs_compare_sum[:benifit] = "Buying is better than renting even if you could rent for free! In addition, you can save average #{ ActionController::Base.helpers.number_to_currency(@mortgage_interest_deduction.round(2)) } per year from your federal taxable income. Increase your profit by visiting our <a href=''>MORTGAGE RATES</a> and getting a more favorable mortgages."
    else
      if (@costs_compare_sum[:buy].abs >0 && @costs_compare_sum[:rent].abs > @costs_compare_sum[:buy].abs)
        @costs_compare_sum[:benifit] = "Buying is cheaper than renting! You’ll earn an extra #{ActionController::Base.helpers.number_to_currency(((@costs_compare_sum[:buy] - @costs_compare_sum[:rent]).round(2)))} after #{@mortgage_term} years of buying a house. In addition, you can save average #{ActionController::Base.helpers.number_to_currency(@mortgage_interest_deduction.round(2))} per year from your federal taxable income. If you lower your mortgage interest rate, you could save more! Come to visit our <a href='#'>MORTGAGE RATES</a> and find other favorable mortgages."
      else
        if (@costs_compare_sum[:buy].abs >0 && @costs_compare_sum[:rent].abs == @costs_compare_sum[:buy].abs )
            @costs_compare_sum[:benifit] = "The cost of buying a house is about the same as renting a house for #{@mortgage_term} years! However, you could save more through lowering your mortgage interest rate. Come to visit our <a href=''>MORTGAGE RATES</a> to get more favorable mortgages."
          else
           @costs_compare_sum[:benifit] = "You'd better to rent a house instead pf buying. Or you could lower your mortgage interest rate to save the cost of buying. Come to visit our <a href=''>MORTGAGE RATES</a> to get more favorable mortgages."
        end
      end
    end
  end

  def monthly_payoff_schedule
    @monthly_payoff_list = [{
      :payoff_remaining=>calculate_loan_payment,
      :payoff_interest=>0.0, 
      :payoff_principal=>0.0,
      :month=>0
    }]
    x = 1

    while x <= number_of_payments.to_i
      monthly_payoff = {}
      monthly_payoff[:month] = x

      monthly_payoff[:payoff_interest] = (monthly_interest_rate*@monthly_payoff_list[x-1][:payoff_remaining])
      
      monthly_payoff[:payoff_principal] = calculate_monthly_payment - monthly_payoff[:payoff_interest].to_f < @monthly_payoff_list[x-1][:payoff_remaining] ?  (calculate_monthly_payment - monthly_payoff[:payoff_interest].to_f) : (@monthly_payoff_list[x-1][:payoff_remaining])

      monthly_payoff[:payoff_remaining] = (@monthly_payoff_list[x-1][:payoff_remaining] -  monthly_payoff[:payoff_principal])

      @monthly_payoff_list.push(monthly_payoff)
      x += 1
    end

    monthly_payoff_list2 = []
    @monthly_payoff_list.each_with_index do |monthly_payoff, index|
      monthly_payoff2 = {}
      if index>0
        monthly_payoff2[:month] = monthly_payoff[:month]
        monthly_payoff2[:payoff_interest] = monthly_payoff[:payoff_interest].round(2)
        monthly_payoff2[:payoff_principal] = monthly_payoff[:payoff_principal].round(2)
        monthly_payoff2[:payoff_remaining] = monthly_payoff[:payoff_remaining].round(2)
        monthly_payoff_list2.push(monthly_payoff2)
      end
    end
    @monthly_payoff_list = monthly_payoff_list2

    return @monthly_payoff_list
  end

  def monthly_payoff_schedule_graph
    remaining_amount =  calculate_loan_payment
    @payoff_schedule_graph = [
      {:name=>"Principal", :data=>{}, dataset: {borderWidth:5}},
      {:name=>"Interest", :data=>{}, dataset: {borderDash: [10,4]}},
      {:name=>"Remaining", :data=>{}, dataset: {borderDash: [10,4]}},
      {:name=>"Total Paid", :data=>{}, dataset: {borderWidth:6}},
    ]

    x = 1
      monthly_payoff_interest = {}
      monthly_payoff_principle = {}
      monthly_payoff_remaining = {}
      monthly_payoff_total = {}

    while x <= number_of_payments.to_i
      monthly_payoff_interest[x] =  monthly_interest_rate*remaining_amount

      monthly_payoff_principle[x] =  calculate_monthly_payment - monthly_payoff_interest[x].to_f < remaining_amount ?  (calculate_monthly_payment - monthly_payoff_interest[x].to_f) : (remaining_amount)
      monthly_payoff_total[x] = monthly_payoff_interest[x] + monthly_payoff_principle[x]

      monthly_payoff_remaining[x] =  (remaining_amount -  monthly_payoff_principle[x])
      remaining_amount = remaining_amount-monthly_payoff_principle[x]
      @payoff_schedule_graph[0][:data]= monthly_payoff_principle
      @payoff_schedule_graph[1][:data]= monthly_payoff_interest
      @payoff_schedule_graph[2][:data]= monthly_payoff_remaining
      @payoff_schedule_graph[3][:data]= monthly_payoff_total

      x += 1
    end
    interest_amount2 = {}
    principle_amount2 = {}
    remaining_amount2 = {}
    total_amount2 = {}

    @payoff_schedule_graph[0][:data].values.each_with_index do |value, index|
      if (index==0)
        principle_amount2[index+1] = value
      elsif (index>=1)
        principle_amount2[index+1] = principle_amount2[index] + value.round(2)
      end
    end

    @payoff_schedule_graph[1][:data].values.each_with_index do |value, index|
      if (index==0)
        interest_amount2[index+1] = value
      elsif (index>=1)
        interest_amount2[index+1] = interest_amount2[index] + value.round(2)
      end
    end

    @payoff_schedule_graph[2][:data].values.each_with_index do |value, index|
      remaining_amount2[index+1] = value.round(2)
    end

    @payoff_schedule_graph[3][:data].values.each_with_index do |value, index|
      if (index==0)
        total_amount2[index+1] = value
      elsif (index>=1)
        total_amount2[index+1] = total_amount2[index] + value
      end
    end

    @payoff_schedule_graph[0][:data] = principle_amount2
    @payoff_schedule_graph[1][:data] = interest_amount2
    @payoff_schedule_graph[2][:data] = remaining_amount2
    @payoff_schedule_graph[3][:data] = total_amount2

    interest_amount3 = {}
    principle_amount3 = {}
    total_amount3 = {}

    @payoff_schedule_graph[0][:data].values.each_with_index do |value, index|
      principle_amount3[index+1] = value.round(2)
    end

    @payoff_schedule_graph[1][:data].values.each_with_index do |value, index|
      interest_amount3[index+1] = value.round(2)
    end

    @payoff_schedule_graph[3][:data].values.each_with_index do |value, index|
      total_amount3[index+1] = value.round(2)
    end

    @payoff_schedule_graph[0][:data] = principle_amount3
    @payoff_schedule_graph[1][:data] = interest_amount3
    @payoff_schedule_graph[3][:data] = total_amount3
    @payoff_over_time_max = ((@payoff_schedule_graph[3][:data].values.max.ceil/50000)+1)*50000
  end

  def monthly_expenses_breakdown
    @mortgage_principal = {}
    @mortgage_interest  = {}
    @home_insurance = {}
    @pmi_insurance = {}
    @hoa_dues = {}
    @monthly_expenses_sum = {}

    @mortgage_principal[:monthly] = (calculate_loan_payment/number_of_payments) rescue 0.0
    @mortgage_principal[:total] = calculate_loan_payment
    
    @mortgage_interest[:monthly] = (calculate_monthly_payment-@mortgage_principal[:monthly]) rescue 0.0
    @mortgage_interest[:total] =  (calculate_monthly_payment*number_of_payments-@mortgage_principal[:total]) rescue 0.0

    # @property_tax = {}
    # @property_tax[:monthly] = calculate_monthly_property_tax rescue 0.0
    # @property_tax[:total] = (@property_tax[:monthly]*number_of_payments) rescue 0.0
    
    if params["monthly_home_insurance"].present?
      @home_insurance[:monthly] = params["monthly_home_insurance"].to_f
    else
      @home_insurance[:monthly] = (@home_price*0.35).round(2) rescue 0.0
    end

    # @home_insurance[:monthly] = ((@default_annual_home_insurance*1.0)/12) rescue 0.0

    @home_insurance[:total] = ((@default_annual_home_insurance*1.0*number_of_payments)/12) rescue 0.0
    
    if params["monthly_pmi_insurance"].present?
      @pmi_insurance[:monthly] = params["monthly_pmi_insurance"].to_f
      @default_pmi_insurance = params["monthly_pmi_insurance"].to_f
    else
      @pmi_insurance[:monthly] = @default_pmi_insurance rescue 0.0
    end
    @pmi_insurance[:total] =  @pmi_insurance[:monthly].to_i == 0 ? 0.0 :  @pmi_insurance[:monthly]*calculate_pmi_term rescue 0.0

    if params["monthly_hoa_dues"].present?
      @hoa_dues[:monthly] = params["monthly_hoa_dues"].to_f
    else
      @hoa_dues[:monthly] = 0.00
    end

    @hoa_dues[:total] = (@hoa_dues[:monthly]*number_of_payments) rescue 0.0

    @monthly_expenses_sum[:monthly] =  ((@mortgage_principal[:monthly] + @mortgage_interest[:monthly] + @property_tax[:monthly] + @home_insurance[:monthly] + @pmi_insurance[:monthly] + @hoa_dues[:monthly]))  rescue 0.0

    @monthly_expenses_sum[:total] = ((@mortgage_principal[:total] + @mortgage_interest[:total] + @property_tax[:total] + @home_insurance[:total] + @pmi_insurance[:total])) rescue 0.0
        
    @mortgage_principal[:percentage] = ((@mortgage_principal[:monthly]*100 / @monthly_expenses_sum[:monthly])).round(2) rescue 0.0

    @mortgage_interest[:percentage] =  ((@mortgage_interest[:monthly]*100 / @monthly_expenses_sum[:monthly])).round(2) rescue 0.0

    @property_tax[:percentage] = ((@property_tax[:monthly]*100 / @monthly_expenses_sum[:monthly])).round(2) rescue 0.0

    @home_insurance[:percentage] = ((@home_insurance[:monthly]*100 / @monthly_expenses_sum[:monthly])).round(2) rescue 0.0

    @pmi_insurance[:percentage] =  ((@pmi_insurance[:monthly]*100 / @monthly_expenses_sum[:monthly])).round(2) rescue 0.0

    @hoa_dues[:percentage] =  ((@hoa_dues[:monthly]*100 / @monthly_expenses_sum[:monthly])).round(2) rescue 0.0

    @monthly_expenses_sum[:percentage] = (@mortgage_principal[:percentage] + @mortgage_interest[:percentage] + @property_tax[:percentage] + @home_insurance[:percentage] + @pmi_insurance[:percentage] + @hoa_dues[:percentage]).round() rescue 100
  end

  def calculate_pmi_term
    (((@home_price*0.22- @down_payment)/((@home_price-@down_payment)/number_of_payments)).ceil) rescue 0
  end

  def calculate_monthly_property_tax
    @property_tax = {}

    if params["monthly_property_tax"].present?
        @property_tax[:monthly] = params["monthly_property_tax"].to_f rescue 0.0
        @property_tax[:total] = (@property_tax[:monthly]*number_of_payments) rescue 0.0
    else
      @property_tax[:monthly] = (@home_price * @default_property_tax_perc*1.0 /100/12) rescue 0.0
      @property_tax[:total] = (@property_tax[:monthly]*number_of_payments) rescue 0.0
    end
    return @property_tax[:monthly]
  end

  def calculate_discount_factor
    dis_factor = ((((1+monthly_interest_rate) ** number_of_payments)-1)/(monthly_interest_rate * (1 + monthly_interest_rate)** number_of_payments)) rescue 0.0
    dis_factor = 0.0 if (dis_factor.nan? || dis_factor.infinite?)
    return dis_factor.to_f
  end

  def monthly_interest_rate
    (@annual_interest_rate.to_f*1.0/12/100) rescue 0.0
  end

  def number_of_payments
    @n = (@mortgage_term * 12) rescue 0
  end

  def calculate_loan_payment
    (@home_price - @down_payment).to_f rescue 0
  end

  def load_default
    @zip_code = "88901"
    @home_price = 300000
    @down_payment = 50000
    @mortgage_term = 30
    @annual_interest_rate = 4.0
    @default_property_tax_perc = 0.86
    @default_annual_home_insurance = 974
    @default_pmi_insurance = 100.00
    @price_to_rent_ratio = 38.02

    @purpose_list = [['Purchase', 'Purchase']]
    @mortgage_term_list = [ ['15 years', 15], ['20 years', 20], ['25 years', 25], ['30 years', 30]]
  end

  def set_variables
    @zip_code = params[:zip_code] if params[:zip_code].present?
    @home_price = params[:home_price].gsub(/[$,]/,'').to_i if params[:home_price].present?
    @down_payment = params[:down_payment].gsub(/[$,]/,'').to_i if params[:down_payment].present?
    @mortgage_term = params[:mortgage_term].to_i if params[:mortgage_term].present?
    @annual_interest_rate = params[:annual_interest_rate].to_f if params[:annual_interest_rate].present?  
  end

  def set_default_pmi_insurance
      @default_pmi_insurance = ((@home_price*0.5)/100).to_f
    return @default_pmi_insurance
  end

  def set_property_tax_and_home_insurance_and_price_to_rent_ratio_by_zip_code
    location = ZipCodes.identify(@zip_code)
    if location.present?
      state_name = location[:state_name]
      state_code = location[:state_code]
      city = location[:city]
      property_tax = CalculatorPropertyTax.where(state_code: state_code)
      if property_tax.present?
         @default_property_tax_perc =  property_tax.first.tax_rate
      end

      home_insurance = CalculatorHomeInsurance.where(state_code: state_code)
      if home_insurance.present?
        @default_annual_home_insurance = home_insurance.first.avg_annual_insurance
      end

      price_to_rent_ratio = CalculatorPriceToRentRatio.where(city: city)
      if price_to_rent_ratio.present?
        @price_to_rent_ratio = price_to_rent_ratio.first.price_rent_ratio
      else
        price_to_rent_ratio = CalculatorPriceToRentRatio.where(state_code: state_code)
        if price_to_rent_ratio.present?
          @price_to_rent_ratio = price_to_rent_ratio.first.price_rent_ratio
        end
      end

    end
  end

  def set_affordability_chart_data
    @ca_affordability = {}
    @nation_wide_affordability = {}

    ca_affordability_list = CalculatorHomeAffordability.where(state_code: "CA")
    if ca_affordability_list.present?
      ca_affordability_list.each do |ca_aff|
        @ca_affordability[ca_aff.date.strftime("%m/%Y")] = ca_aff.home_price_index.round(2)
      end
    end

    nation_wide_affordability_list = CalculatorHomeAffordability.where(state_code: "Nationwide")
    if nation_wide_affordability_list.present?
      nation_wide_affordability_list.each do |nation_wide|
        @nation_wide_affordability[nation_wide.date.strftime("%m/%Y")] = nation_wide.home_price_index
      end
    end

    if nation_wide_affordability_list.present? && ca_affordability_list.present?
      if nation_wide_affordability_list.maximum(:home_price_index) > ca_affordability_list.maximum(:home_price_index)
        @area_chart_max = nation_wide_affordability_list.maximum(:home_price_index)
      else
        @area_chart_max = ca_affordability_list.maximum(:home_price_index)
      end
      @area_chart_max = ((@area_chart_max.ceil/50)+1)*50
    end

  end
end