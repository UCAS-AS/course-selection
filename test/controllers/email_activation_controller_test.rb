require 'test_helper'

class EmailActivationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get email_activation_new_url
    assert_response :success
  end

  test "should get destroy" do
    get email_activation_destroy_url
    assert_response :success
  end

  test "should get update" do
    get email_activation_update_url
    assert_response :success
  end

end
