require 'test_helper'

class FormFieldInputsControllerTest < ActionController::TestCase
  setup do
    @form_field_input = form_field_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_field_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_field_input" do
    assert_difference('FormFieldInput.count') do
      post :create, form_field_input: { form_field_id: @form_field_input.form_field_id, input: @form_field_input.input, student_application_id: @form_field_input.student_application_id }
    end

    assert_redirected_to form_field_input_path(assigns(:form_field_input))
  end

  test "should show form_field_input" do
    get :show, id: @form_field_input
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_field_input
    assert_response :success
  end

  test "should update form_field_input" do
    patch :update, id: @form_field_input, form_field_input: { form_field_id: @form_field_input.form_field_id, input: @form_field_input.input, student_application_id: @form_field_input.student_application_id }
    assert_redirected_to form_field_input_path(assigns(:form_field_input))
  end

  test "should destroy form_field_input" do
    assert_difference('FormFieldInput.count', -1) do
      delete :destroy, id: @form_field_input
    end

    assert_redirected_to form_field_inputs_path
  end
end
