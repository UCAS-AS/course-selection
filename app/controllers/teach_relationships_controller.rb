class TeachRelationshipsController < ApplicationController
  before_action :is_teacher?
  before_action :is_current_teacher?, :check_grade, only: [:update]
  before_action :check_content, only: [:send_course_notification]

  def my_courses
    @current_user = current_user
    @courses = @current_user.courses
  end

  def submit_grades
    @current_user = current_user
    @courses = @current_user.courses
  end

  def notification
    @current_user = current_user
    @courses = @current_user.courses
  end

  def students_of_course
    @course = Course.find_by(cno: params[:cno])
    @page = params[:page]
    @students = @course.students.paginate(page: @page)
  end

  def send_course_notification
    p params
    cno = params[:course].split(":")
    @course = Course.find_by(cno: cno)
    @current_user = Teacher.find_by(tno: session[:no])

    if @course.teachers.include? @current_user
      flash[:success] = "您的课程通知已通过邮件发送给所有选课学生。"
      @current_user.send_course_notification_email(@course, params[:title], params[:content])
    end

    redirect_to notification_url
  end

  def update
    @course = Course.find(params[:cid])
    @student = Student.find(params[:sid])
    if @course.nil? || @student.nil?
      flash[:danger] = "找不到课程或者学生！"
    else
      select = SelectRelationship.find_by(course_id: @course.id, student_id: @student.id)
      if select.nil?
        flash[:danger] = "学生" + @student.name + "不在选课名单中。"
      else
        select.update_attribute :grade, params[:grade]
        flash[:success] = "学生" + @student.name + "的成绩已修改为：" + params[:grade] + "。"
      end
    end

    redirect_to students_of_course_url(cno: @course.cno, page: params[:page])
  end

  private

  def is_current_teacher?
    @current_teacher = Teacher.find_by(tno: session[:no])
    unless Course.find(params[:cid]).teachers.include? @current_teacher
      log_out
      redirect_to root_url
    end
  end

  def check_grade
    grade = params[:grade].to_f
    @course = Course.find(params[:cid])
    unless grade.is_a?(Numeric) && grade.to_f >= 0 && grade.to_f <= 100
      flash[:warning] = "成绩格式错误，应为0～100之间的保留一位小数的数字。"
      redirect_to students_of_course_url(cno: @course.cno, page: params[:page])
    end
  end

  def check_content
    title = params[:title]
    content = params[:content]
    if title.blank? || content.blank?
      flash[:warning] = "标题或者内容不能为空。"
      redirect_to notification_url
    end
  end
end
