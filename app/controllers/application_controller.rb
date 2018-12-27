class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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


end