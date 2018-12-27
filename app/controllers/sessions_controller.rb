class SessionsController < ApplicationController
  include MessageHelper::User

  def new
    if logged_in?
      redirect_to home_url
    end
  end

  def create
    option = session_params[:option]
    if option == 'teacher'
      teacher = Teacher.find_by(tno: session_params[:account])
      if teacher.nil?
        flash[:warning] = USER_TCHR_ACCOUNT_NOT_EXIST
        redirect_to login_url
      elsif !teacher.authenticated?('password', session_params[:password])
        flash[:warning] = USER_WRONG_PASSWORD
        redirect_to login_url
      else
        log_in teacher.tno, option
        session_params[:remember_me] == '1' ? teacher.remember : teacher.forget
        redirect_to home_url
      end
    elsif option == 'student'
      student = Student.find_by(sno: session_params[:account])
      if student.nil?
        flash[:warning] = USER_STU_ACCOUNT_NOT_EXIST
        redirect_to login_url
      elsif !student.authenticated?('password', session_params[:password])
        flash[:warning] = USER_WRONG_PASSWORD
        redirect_to login_url
      else
        log_in student.sno, option
        session_params[:remember_me] == '1' ? student.remember : student.forget
        redirect_to home_url
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def session_params
    params[:session]
  end
end
