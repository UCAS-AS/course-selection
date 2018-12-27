class CoursesController < ApplicationController

  def new
  end

  def create
  end

  def update
  end

  def show
    @courses = Course.find(params[:id])
  end

  def index
    @courses = Course.all
  end

  def select_courses

  end

  def selected_courses
    if option == 'student'
      current_student = Student.find_by(sno: session[:no])
      @courses = current_student.courses
    end
  end

  def get_select_courses
    @student_courses = Student.find_by(sno: session[:no]).courses
    @courses = Course.all
    json_a = {total: 0, rows: []}
    @courses.each do |c|
      unless @student_courses.include? c
        json_object = {cno: c.cno,
                       title: c.title,
                       week_time_classroom: c.week_time_classroom,
                       teachers: get_teachers_name(c),
                       year: c.year,
                       semester: c.semester,
                       credit_and_hours: c.credit.to_s + "/" + c.hours.to_s,
                       select_limit_and_selected_count: c.select_limit.to_s + "/" + c.students.count.to_s,
                       dept_name: c.department.name,
                       course_type: c.course_type}
        json_a[:rows] << json_object
      end
    end
    !json_a[:rows][params[:offset].to_i, params[:limit].to_i]
    json_a[:total] = json_a[:rows].count
    render :json => json_a.to_json
  end

  def get_selected_courses
    @current_user = Student.find_by(sno: session[:no])
    @courses = @current_user.courses
    json_a = {total: @courses.count, rows: []}
    @courses.each do |c|
      @select = SelectRelationship.find_by(student_id: @current_user.id, course_id: c.id)
      json_object = {cno: c.cno,
                     title: c.title,
                     week_time_classroom: c.week_time_classroom,
                     teachers: get_teachers_name(c),
                     year: c.year,
                     semester: c.semester,
                     credit_and_hours: c.credit.to_s + "/" + c.hours.to_s,
                     select_limit_and_selected_count: c.select_limit.to_s + "/" + c.students.count.to_s,
                     dept_name: c.department.name,
                     course_type: c.course_type,
                     is_degree_course: @select.is_degree_course}
      json_a[:rows] << json_object
    end
    !json_a[:rows][params[:offset].to_i, params[:limit].to_i]
    render :json => json_a.to_json
  end

  def credit_count

  end

end
