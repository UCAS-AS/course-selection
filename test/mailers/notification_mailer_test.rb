require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "system_notification" do
    mail = NotificationMailer.system_notification
    assert_equal "System notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "course_notification" do
    mail = NotificationMailer.course_notification
    assert_equal "Course notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
