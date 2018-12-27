class StaticPagesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, except: [:forget_password]

  def home
    unless logged_in?
      redirect_to root_url
    end
  end

  def user_profile

  end

  def update_password

  end

  def email_setting
    @current_user = current_user
  end

  def forget_password

  end
end


