require 'test_helper'

class SteepInstructionsControllerTest < ActionController::TestCase
  setup do
    @steep_instruction = steep_instructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steep_instructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create steep_instruction" do
    assert_difference('SteepInstruction.count') do
      post :create, steep_instruction: { recipe_id: @steep_instruction.recipe_id, temperature: @steep_instruction.temperature, time: @steep_instruction.time }
    end

    assert_redirected_to steep_instruction_path(assigns(:steep_instruction))
  end

  test "should show steep_instruction" do
    get :show, id: @steep_instruction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @steep_instruction
    assert_response :success
  end

  test "should update steep_instruction" do
    patch :update, id: @steep_instruction, steep_instruction: { recipe_id: @steep_instruction.recipe_id, temperature: @steep_instruction.temperature, time: @steep_instruction.time }
    assert_redirected_to steep_instruction_path(assigns(:steep_instruction))
  end

  test "should destroy steep_instruction" do
    assert_difference('SteepInstruction.count', -1) do
      delete :destroy, id: @steep_instruction
    end

    assert_redirected_to steep_instructions_path
  end
end
