class CoursesController < ApplicationController
  before_action :is_logged_in?
  before_action :is_teacher?, only: [:my_courses,
                                     :submit_grades,
                                     :notification]
  before_action :is_student?, only: [:select_courses,
                                     :selected_courses,
                                     :get_select_courses,
                                     :get_selected_courses,
                                     :credit_count]

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
    @years = [2017, 2018, 2019, 2020]
    @semester = ["春季", "秋季", "夏季"]
    @course_types = ["专业必修课", "专业选修课", "专业核心课", "公共必修课", "公共选修课", "专业讨论课"]
    @page = params[:page]
    @query_params = Hash.new
    @departments = Department.all

    unless params[:department].nil? || params[:department] == "全部"
      @query_params.store :department_id, params[:department].to_i
    end
    unless params[:year].nil? || params[:year] == "全部"
      @query_params.store :year, params[:year]
    end
    unless params[:semester].nil? || params[:semester] == "全部"
      @query_params.store :semester, params[:semester]
    end
    unless params[:course_type].nil? || params[:course_type] == "全部"
      @query_params.store :course_type, params[:course_type]
    end

    p "Query params: " + @query_params.to_s

    @current_user = Student.find_by(sno: session[:no])
    @courses = Course.where(@query_params).paginate(page: @page)
  end

  def selected_courses
    @years = [2017, 2018, 2019, 2020]
    @semester = ["春季", "秋季", "夏季"]
    @course_types = ["专业必修课", "专业选修课", "专业核心课", "公共必修课", "公共选修课", "专业讨论课"]
    @page = params[:page]
    @query_params = Hash.new
    @departments = Department.all

    unless params[:department].nil? || params[:department] == "全部"
      @query_params.store :department_id, params[:department].to_i
    end
    unless params[:year].nil? || params[:year] == "全部"
      @query_params.store :year, params[:year]
    end
    unless params[:semester].nil? || params[:semester] == "全部"
      @query_params.store :semester, params[:semester]
    end
    unless params[:course_type].nil? || params[:course_type] == "全部"
      @query_params.store :course_type, params[:course_type]
    end

    @current_user = Student.find_by(sno: session[:no])
    @courses = @current_user.courses.where(@query_params).paginate(page: @page)
  end

  def credit_count
    @current_user = current_user
  end

  def my_courses
    @courses = @current_user.courses
  end

  def submit_grades

  end

  def notification

  end


end
