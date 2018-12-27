class EmailActivationController < ApplicationController
  before_action :is_logged_in?, only: [:create]

  def new
  end

  def edit
    p params
    id = params[:user_id]
    email = params[:email]

    temp_user = Student.find(id) || Teacher.find(id)

    if temp_user.nil?
      flash[:danger] = "邮箱没有绑定任何用户。"
    elsif temp_user.email == email
      flash[:warning] = "您的邮箱已激活。"
    elsif temp_user.email_activation_expired?
      flash[:warning] = "激活链接已过期。"
    elsif temp_user.authenticated? 'email_activation', params[:id]
      flash[:success] = "您的新邮箱已成功激活！"
      temp_user.email_activation email
      if logged_in?
        redirect_to email_setting_url
      else
        redirect_to root_url
      end
    end

  end

  def create
    new_email = params[:new_email]
    @option = option
    @current_user = current_user

    if !@current_user.email_activation_digest.nil?
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
