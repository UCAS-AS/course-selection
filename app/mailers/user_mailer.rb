class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.email_activation.subject
  #
  def email_activation(user, email, option)
    @greeting = "您好"
    @user = user
    @new_email = email
    @option = option
    mail to: @new_email, subject: "邮箱激活 - 选课系统"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @greeting = "您好"
    @user = user
    mail to: user.email, subject: '密码重置 - 选课系统'
  end
end
