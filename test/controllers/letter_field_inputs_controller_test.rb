require 'test_helper'

class LetterFieldInputsControllerTest < ActionController::TestCase
  setup do
    @letter_field_input = letter_field_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:letter_field_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create letter_field_input" do
    assert_difference('LetterFieldInput.count') do
      post :create, letter_field_input: { form_field_id: @letter_field_input.form_field_id, input: @letter_field_input.input, letter_request_id: @letter_field_input.letter_request_id }
    end

    assert_redirected_to letter_field_input_path(assigns(:letter_field_input))
  end

  test "should show letter_field_input" do
    get :show, id: @letter_field_input
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @letter_field_input
    assert_response :success
  end

  test "should update letter_field_input" do
    patch :update, id: @letter_field_input, letter_field_input: { form_field_id: @letter_field_input.form_field_id, input: @letter_field_input.input, letter_request_id: @letter_field_input.letter_request_id }
    assert_redirected_to letter_field_input_path(assigns(:letter_field_input))
  end

  test "should destroy letter_field_input" do
    assert_difference('LetterFieldInput.count', -1) do
      delete :destroy, id: @letter_field_input
    end

    assert_redirected_to letter_field_inputs_path
  end
end
