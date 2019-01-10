require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "a student login with invalid information" do
    get login_url
    assert_response :success
    assert_template 'sessions/new'
    post login_url, params: {session: {account: "1nowndo1213123", password: "fqwdwd2", option: "student"}}
    assert_redirected_to login_url
    assert_not flash.empty?
  end

  test "a student login with valid information" do
    get login_url
    assert_response :success
    assert_template 'sessions/new'
    post login_url, params: {session: {account: "2018E8015061017", password: "neptune.", option: "student"}}
    assert_redirected_to home_url
    assert flash.empty?
  end

  test "a teacher login with invalid information" do
    get login_url
    assert_response :success
    assert_template 'sessions/new'
    post login_url, params: {session: {account: "1nowndo1213123", password: "fqwdwd2", option: "teacher"}}
    assert_redirected_to login_url
    assert_not flash.empty?
  end

  test "a teacher login with valid information" do
    get login_url
    assert_response :success
    assert_template 'sessions/new'
    post login_url, params: {session: {account: "200010101000", password: "neptune.", option: "teacher"}}
    assert_redirected_to home_url
    assert flash.empty?
  end
end
