class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
    if user_signed_in?
        redirect_to :controller=>'home', :action => 'dashboard'
    end
  end

  def dashboard

  end
end
