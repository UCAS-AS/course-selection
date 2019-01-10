require 'test_helper'

class ActionsAfterLoginTest < ActionDispatch::IntegrationTest

  test "should redirect to home page after login" do
    get login_url
    post login_url, params: {session: {account: "2018E8015061017", password: "neptune.", option: "student"}}
    assert is_logged_in?
    assert_redirected_to home_url
  end

end
