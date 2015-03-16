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
end
