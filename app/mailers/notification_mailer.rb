class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.system_notification.subject
  #
  def system_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.course_notification.subject
  #
  def course_notification(teacher, course, subject, content)
    @content = content
    @subject = subject
    @teacher = teacher
    @course = course
    students = @course.students
    students.each do |s|
      unless s.email.nil?
        mail to: s.email, subject: subject
      end
    end

  end
end
