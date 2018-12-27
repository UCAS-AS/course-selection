require 'test_helper'

class TeachRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get my_courses" do
    get teach_relationships_my_courses_url
    assert_response :success
  end

  test "should get submit_grades" do
    get teach_relationships_submit_grades_url
    assert_response :success
  end

  test "should get notification" do
    get teach_relationships_notification_url
    assert_response :success
  end

end
