require 'test_helper'

class LetterRequestsControllerTest < ActionController::TestCase
  setup do
    @letter_request = letter_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:letter_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create letter_request" do
    assert_difference('LetterRequest.count') do
      post :create, letter_request: { access_code: @letter_request.access_code, professor_email: @letter_request.professor_email, student_application_id: @letter_request.student_application_id }
    end

    assert_redirected_to letter_request_path(assigns(:letter_request))
  end

  test "should show letter_request" do
    get :show, id: @letter_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @letter_request
    assert_response :success
  end

  test "should update letter_request" do
    patch :update, id: @letter_request, letter_request: { access_code: @letter_request.access_code, professor_email: @letter_request.professor_email, student_application_id: @letter_request.student_application_id }
    assert_redirected_to letter_request_path(assigns(:letter_request))
  end

  test "should destroy letter_request" do
    assert_difference('LetterRequest.count', -1) do
      delete :destroy, id: @letter_request
    end

    assert_redirected_to letter_requests_path
  end
end
