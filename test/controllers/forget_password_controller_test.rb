require 'test_helper'

class ForgetPasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get forget_password_create_url
    assert_response :success
  end

  test "should get destroy" do
    get forget_password_destroy_url
    assert_response :success
  end

end
