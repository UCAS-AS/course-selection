class SelectRelationshipsController < ApplicationController
  before_action :logged_in_user

  def new
  end

  def create
    if option == 'student'
      @current_user = current_user
      @course = Course.find_by(cno: params[:cno])
      if @course.students.count + 1 >= @course.select_limit
        flash[:warning] = "选课失败，课程《" + @course.title + "》已达最大选课人数。"
      else
        conflict_course = check @current_user, @course
        if !conflict_course
          @current_user.select @course
          flash[:success] = "选课成功！课程《" + @course.title + "》已添加到您的选课表中。"
        else
          flash[:danger] = "选课失败，该课程的时间与您已选的课程《" + conflict_course + "》冲突。"
        end
      end
      redirect_to select_courses_url
    end
  end

  def update
    if option == 'student'
      @option = params[:option]
      @course = Course.find_by(cno: params[:cno])
      @current_user = current_user
      if @option == "set" && !(@current_user.set_degree_course @course).nil?
        flash[:success] = "已将课程《" + @course.title + "》设为您的学位课。"
      elsif @option == "un_set" && !(@current_user.set_degree_course @course).nil?
        flash[:success] = "已将课程《" + @course.title + "》从您的学位课中移除。"
        @current_user.un_set_degree_course @course
      else
        flash[:danger] = "设置失败，请稍后再试。"
      end
      redirect_to selected_courses_url
    end

  end

  def grades
    @current_user = current_user
    @courses = @current_user.courses
  end

  def destroy
    if option == 'student'
      @current_user = current_user
      @course = Course.find_by(cno: params[:cno])
      grade = get_grade @current_user, @course
      if grade.nil?
        @current_user.un_select @course
        flash[:success] = "退课成功！课程《" + @course.title + "》已从您的选课表中移除。"
        redirect_to selected_courses_url
      else
        flash[:danger] = "退课失败！课程《" + @course.title + "》已登记您的成绩。"
        redirect_to selected_courses_url
      end
    end
  end

  private

  def check(student, course)
    time_tree = Hash.new
    student.courses.each do |c|
      time_tree.merge!(time_tree c.week_time_classroom, c.title)
    end
    conflict course.week_time_classroom, time_tree
  end


end
