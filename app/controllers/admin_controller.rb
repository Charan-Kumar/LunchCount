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
      @count = FoodCount.date_range(params[:from],params[:to])
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
