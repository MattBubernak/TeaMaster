require 'test_helper'

class IngredientMeasurementsControllerTest < ActionController::TestCase
  setup do
    @ingredient_measurement = ingredient_measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient_measurement" do
    assert_difference('IngredientMeasurement.count') do
      post :create, ingredient_measurement: {  }
    end

    assert_redirected_to ingredient_measurement_path(assigns(:ingredient_measurement))
  end

  test "should show ingredient_measurement" do
    get :show, id: @ingredient_measurement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_measurement
    assert_response :success
  end

  test "should update ingredient_measurement" do
    patch :update, id: @ingredient_measurement, ingredient_measurement: {  }
    assert_redirected_to ingredient_measurement_path(assigns(:ingredient_measurement))
  end

  test "should destroy ingredient_measurement" do
    assert_difference('IngredientMeasurement.count', -1) do
      delete :destroy, id: @ingredient_measurement
    end

    assert_redirected_to ingredient_measurements_path
  end
end
