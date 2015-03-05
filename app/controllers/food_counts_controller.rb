class FoodCountsController < ApplicationController
  before_action :set_food_count, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    current_id = User.find(current_user).id
    @food_counts = FoodCount.where(user_id:current_id)
    respond_to do |format|
      format.html # this handles normal requests asking for html
      format.json{ render json: @food_counts }
    end
  end

  def show
    respond_with(@food_count)
  end

  def new
    @food_count = FoodCount.new
    respond_with(@food_count)
  end

  def edit
  end

  def create
    @food_count = FoodCount.new(food_count_params)
    respond_to do |format|
      if @food_count.save
        format.html { redirect_to @food_count, notice: 'FoodCount was successfully created.' }
        format.json { render json: @food_count, status: :created, location: @food_count }
      else
        format.html { render action: "new" }
        format.json { render json: @food_count.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @food_count.update(food_count_params)
    respond_with(@food_count)
  end

  def destroy
    @food_count.destroy
    respond_with(@food_count)
  end


  private
    def set_food_count
      @food_count = FoodCount.find(params[:id])
    end

    def food_count_params
      params.require(:food_count).permit(:user_id, :date, :selection)
    end
end
