# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    @user = Student.first
    @user.create_password_reset
    UserMailer.password_reset(@user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/email_activation
  def email_activation
    @user = Student.first
    @user.create_email_activation
    @email = 'yan_fuhai@hotmail.com'
    @option = 'student'
    UserMailer.email_activation @user, @email, @option
  end

end
