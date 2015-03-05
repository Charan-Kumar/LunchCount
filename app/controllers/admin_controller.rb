class AdminController < ApplicationController

  def users
    @all_users = User.all
  end

  def foodcount
  end
end
