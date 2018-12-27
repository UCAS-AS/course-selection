class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include CoursesHelper
  include SelectRelationshipsHelper

  def correct_password
    @old_password = params[:old_password]
    @new_password = params[:password]
    @new_password_confirmation = params[:password_confirmation]
    if @old_password.blank? || @new_password.blank? || @new_password_confirmation.blank?
      flash[:warning] = "密码不能为空！"
      redirect_to password_reset_url
    elsif @new_password_confirmation != @new_password
      flash[:danger] = "两次输入的新密码不一致！"
      redirect_to password_reset_url
    elsif @new_password.length < 8 || @new_password.length > 16 || @new_password_confirmation.length < 8 ||
      @new_password_confirmation.length > 16
      flash[:warning] = "密码长度应为 8-16 位。"
      redirect_to password_reset_url
    end
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = "您尚未登录。"
      redirect_to root_url
    end
  end


end