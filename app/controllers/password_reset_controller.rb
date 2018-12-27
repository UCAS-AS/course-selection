class PasswordResetController < ApplicationController
  before_action :is_logged_in?, only: [:password_setting]
  before_action :correct_password, only: [:update]
  before_action :correct_password_for_setting, only: [:password_setting]

  def edit
    @token = params[:id]
    @email = params[:email]

    temp_user = Student.find_by(email: @email) || Teacher.find_by(email: @email)
    if !temp_user.authenticated?('reset', @token)
      flash[:danger] = "该密码重置链接无效！"
      redirect_to root_url
    elsif temp_user.nil?
      flash[:danger] = "该邮箱没有绑定任何用户"
      redirect_to root_url
    elsif temp_user.password_reset_expired?
      flash[:warning] = '该密码重置链接已过期。'
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def create
    temp_user = Student.find_by(email: params[:email]) || Teacher.find_by(email: params[:email])
    if temp_user.nil?
      flash[:danger] = "该邮箱没有绑定任何用户。"
    else
      if temp_user.already_send_password_reset?
        flash[:warning] = "重置密码链接已发送至您的邮箱，请注意查收。"
      else
        temp_user.create_password_reset
        temp_user.send_password_reset_email
        flash[:success] = "重置密码链接已发送至您的邮箱，请注意查收，有效期为 30 分钟。"
      end
    end
    redirect_to forget_password_url
  end

  def update
    email = params[:email]
    token = params[:token]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    temp_user = Student.find_by(email: email) || Teacher.find_by(email: email)

    if !temp_user.authenticated?('reset', token)
      flash[:danger] = "该密码重置链接无效！"
      redirect_to root_url
    else
      flash[:success] = "您的密码已经重置成功！"
      temp_user.password_reset password, password_confirmation
      redirect_to root_url
    end

  end

  def password_setting
    @current_user = current_user
    @old_password = params[:old_password]
    @new_password = params[:password]
    @new_password_confirmation = params[:password_confirmation]
    if @current_user.authenticated?(:password, @old_password)
      flash[:success] = "您的密码已修改。"
      @current_user.update_password @new_password, @new_password_confirmation
    else
      flash[:danger] = '原密码错误！'
    end
    redirect_to password_setting_url
  end

  private

  def correct_password
    @new_password = params[:password]
    @new_password_confirmation = params[:password_confirmation]
    @token = params[:token]
    @email = params[:email]
    if @new_password.blank? || @new_password_confirmation.blank?
      flash[:warning] = "密码不能为空！"
      redirect_to edit_password_reset_url(@token, {email: @email})
    elsif @new_password_confirmation != @new_password
      flash[:danger] = "两次输入的新密码不一致！"
      redirect_to edit_password_reset_url(@token, {email: @email})
    elsif @new_password.length < 8 || @new_password.length > 16 || @new_password_confirmation.length < 8 ||
      @new_password_confirmation.length > 16
      flash[:warning] = "密码长度应为 8-16 位。"
      redirect_to edit_password_reset_url(@token, {email: @email})
    end
  end

  def correct_password_for_setting
    @old_password = params[:old_password]
    @new_password = params[:password]
    @new_password_confirmation = params[:password_confirmation]
    if @old_password.blank? || @new_password.blank? || @new_password_confirmation.blank?
      flash[:warning] = "密码不能为空！"
      redirect_to password_setting_url
    elsif @new_password_confirmation != @new_password
      flash[:danger] = "两次输入的新密码不一致！"
      redirect_to password_setting_url
    elsif @new_password.length < 8 || @new_password.length > 16 || @new_password_confirmation.length < 8 ||
      @new_password_confirmation.length > 16
      flash[:warning] = "密码长度应为 8-16 位。"
      redirect_to password_setting_url
    end
  end
end
