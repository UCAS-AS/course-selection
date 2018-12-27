class StudentsController < ApplicationController
  before_action :logged_in_user

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
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
