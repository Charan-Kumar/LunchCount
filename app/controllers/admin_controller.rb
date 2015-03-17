class AdminController < ApplicationController

  def users
    @all_users = User.all
  end

  def foodcount
     @fc = FoodCount.by_month
     @today = Date.today
     
  end


  def count_query
    if params[:from] and params[:to]
      h=params[:from]
      from = Date.new(h['Starting Day(1i)'].to_i, h['Starting Day(2i)'].to_i, h['Starting Day(3i)'].to_i).to_s
      h=params[:to]
      month = h['Ending Day(2i)'].to_i
      if(h['Ending Day(3i)'].to_i == 31 and (month == 4 or month == 6 or month == 9 or month ==11))
        to = Date.new(h['Ending Day(1i)'].to_i, h['Ending Day(2i)'].to_i, 30).to_s

      elsif(h['Ending Day(2i)'].to_i == 2)
        to = Date.new(h['Ending Day(1i)'].to_i, h['Ending Day(2i)'].to_i, 28).to_s
      else
        to = Date.new(h['Ending Day(1i)'].to_i, h['Ending Day(2i)'].to_i, h['Ending Day(3i)'].to_i).to_s
      end

      @count = FoodCount.date_range(from,to)
    end
  end

  def future_count
    # if params[:date]
    #    @fc=FoodCount.every_month(params[:date])
    # end
   
    # respond_to do |format|
    #   format.html # this handles normal requests asking for html
    #   format.json{ render json: @fc }
    # end
  end
end
