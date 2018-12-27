module CoursesHelper

  def get_teachers_name(course)
    if course.teachers.count != 1
      course.teachers.first.name + "等"
    else
      course.teachers.first.name
    end
  end

end
