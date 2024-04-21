class ZebraController < ApplicationController
  def new_square
    
    render({ :template => "templates/new_square"})
  end

  def square_results
    @the_num = params.fetch("users_number").to_f

    @the_result = @the_num ** 2
    
    render({ :template => "templates/square_results"})
  end

  def new_square_root
    
    render({ :template => "templates/new_square_root"})
  end

  def square_root_results
    @the_num = params.fetch("users_number").to_f

    @the_result = @the_num ** 0.5
    
    render({ :template => "templates/square_root_results"})
  end

  def new_payment
    
    render({ :template => "templates/new_payment"})
  end

  def payment_results
    @annual_rate = params.fetch("user_apr").to_f
    @monthly_rate = (@annual_rate / 100) / 12
    
    @years = params.fetch("user_years").to_i
    @number_of_payments = @years * 12
  
    @present_value = params.fetch("user_pv").to_f
  
    @monthly_payment = (@monthly_rate * @present_value) / (1 - (1 + @monthly_rate)**(-@number_of_payments))
  
 
    @formatted_annual_rate = (@monthly_rate*1200).to_fs(:percentage, precision: 4)
    @formatted_present_value = @present_value.to_fs(:currency)
    @formatted_monthly_payment = @monthly_payment.to_fs(:currency)
    
    render({ :template => "templates/payment_results"})
  end

  def new_random
    
    render({ :template => "templates/new_random"})
  end

  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
  
    @the_result = rand(@min...@max)
    
    render({ :template => "templates/random_results"})
  end

end
