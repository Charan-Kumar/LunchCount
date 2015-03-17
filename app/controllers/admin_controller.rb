class AdminController < ApplicationController

  def users
    @all_users = User.all
  end

  def foodcount
     @fc = FoodCount.by_month
     @fc_next = FoodCount.by_next_month
     @today = Date.today
     @next_month = Date.today+1.month
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
end
