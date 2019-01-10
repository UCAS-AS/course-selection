require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should get password resetting page" do
    get forget_password_url
    assert_response :success
  end
end

