# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/system_notification
  def system_notification
    NotificationMailer.system_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/course_notification
  def course_notification
    @course = Course.first
    @teacher = @course.teachers.first
    @students = @course.students
    @title = "一个好消息"
    @content = "今天不上课\n大家好好休息"
    NotificationMailer.course_notification @teacher, @course, @students, @title, @content
  end

end
