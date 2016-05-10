require 'test_helper'

class FormFieldValuesControllerTest < ActionController::TestCase
  setup do
    @form_field_value = form_field_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_field_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_field_value" do
    assert_difference('FormFieldValue.count') do
      post :create, form_field_value: { form_field_id: @form_field_value.form_field_id, is_default: @form_field_value.is_default, value: @form_field_value.value }
    end

    assert_redirected_to form_field_value_path(assigns(:form_field_value))
  end

  test "should show form_field_value" do
    get :show, id: @form_field_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_field_value
    assert_response :success
  end

  test "should update form_field_value" do
    patch :update, id: @form_field_value, form_field_value: { form_field_id: @form_field_value.form_field_id, is_default: @form_field_value.is_default, value: @form_field_value.value }
    assert_redirected_to form_field_value_path(assigns(:form_field_value))
  end

  test "should destroy form_field_value" do
    assert_difference('FormFieldValue.count', -1) do
      delete :destroy, id: @form_field_value
    end

    assert_redirected_to form_field_values_path
  end
end
