class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper
  include SessionsHelper
  include CoursesHelper
  include SelectRelationshipsHelper

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = "您尚未登录。"
      redirect_to root_url
    end
  end

  def is_teacher?
    unless option == 'teacher'
      log_out
      flash[:danger] = '身份错误！'
      redirect_to root_url
    end
  end

  def is_student?
    unless option == 'student'
      log_out
      flash[:danger] = '身份错误！'
      redirect_to root_url
    end
  end


end