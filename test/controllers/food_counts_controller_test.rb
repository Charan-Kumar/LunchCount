require 'test_helper'

class FoodCountsControllerTest < ActionController::TestCase
  setup do
    @food_count = food_counts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_count" do
    assert_difference('FoodCount.count') do
      post :create, food_count: { date: @food_count.date, selection: @food_count.selection, user_id: @food_count.user_id }
    end

    assert_redirected_to food_count_path(assigns(:food_count))
  end

  test "should show food_count" do
    get :show, id: @food_count
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_count
    assert_response :success
  end

  test "should update food_count" do
    patch :update, id: @food_count, food_count: { date: @food_count.date, selection: @food_count.selection, user_id: @food_count.user_id }
    assert_redirected_to food_count_path(assigns(:food_count))
  end

  test "should destroy food_count" do
    assert_difference('FoodCount.count', -1) do
      delete :destroy, id: @food_count
    end

    assert_redirected_to food_counts_path
  end
end
