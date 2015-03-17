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
      to = Date.new(h['Ending Day(1i)'].to_i, h['Ending Day(2i)'].to_i, h['Ending Day(3i)'].to_i).to_s
      @count = FoodCount.date_range(from,to)
    end
  end

  def future_count
    @fc=FoodCount.every_month(params[:date])
    respond_to do |format|
      format.html # this handles normal requests asking for html
      format.json{ render json: @fc }
    end
  end
end
