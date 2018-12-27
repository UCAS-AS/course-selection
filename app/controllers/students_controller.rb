class StudentsController < ApplicationController
  before_action :correct_password, only: [:update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def update
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
    redirect_to password_reset_url
  end

  def show
    @student = Student.find(student_params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:sno,
                                    :name,
                                    :email,
                                    :gender,
                                    :enrolled_date,
                                    :degree,
                                    :major,
                                    :phone,
                                    :password,
                                    :password_confirmation)
  end
end
