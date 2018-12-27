class EmailActivationController < ApplicationController
  before_action :is_logged_in?, only: [:create]

  def new
  end

  def edit
    p params
    email = params[:email]
    new_email = params[:new_email]

    if new_email == email
      flash[:warning] = "您的邮箱已激活。"
    else
      temp_user = Student.find_by(email: new_email) || Teacher.find_by(email: new_email)
      user = Student.find_by(email: email) || Teacher.find_by(email: email)

      if !temp_user.nil? || user.nil?
        flash[:danger] = "无效的链接。"
      elsif user.email_activation_expired?
        flash[:warning] = "激活链接已过期。"
      elsif user.authenticated? 'email_activation', params[:id]
        flash[:success] = "您的新邮箱已成功激活！"
        user.email_activation new_email
      end
    end

    if logged_in?
      redirect_to email_setting_url
    else
      redirect_to root_url
    end
  end

  def create
    new_email = params[:new_email]
    @option = option
    @current_user = current_user

    if !@current_user.email_activated_sent_at.nil? && @current_user.email_activated_sent_at >= 30.minutes.ago
      flash[:warning] = "激活邮件已发送至您的邮箱，请注意查收。"
    else
      temp_user = Student.find_by(email: new_email) || Teacher.find_by(email: new_email)

      if !temp_user.nil?
        flash[:danger] = "邮箱 " + new_email + " 已被占用。"
      else
        @current_user.create_email_activation
        @current_user.send_email_activation_email new_email, @option
        flash[:success] = "激活邮件已发送至 " + new_email + "，请注意查看您的邮箱，有效期为 30 分钟。"
      end
    end

    redirect_to email_setting_url
  end

  def destroy
  end

  def update

  end
end
