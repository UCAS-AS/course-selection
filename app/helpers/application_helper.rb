module ApplicationHelper

  def full_title(page_title = '')
    base_title = '选课系统'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def is_degree_course(student, course)
    SelectRelationship.find_by(student_id: student.id, course_id: course.id).is_degree_course
  end

  def get_grade(student, course)
    grade = SelectRelationship.find_by(student_id: student.id, course_id: course.id).grade
  end

  def format_birth_date(user)
    user.birth_date.year + "/" + user.birth_date.month + "/" + user.birth_date.day
  end

  def grade_count(courses)
    if courses.nil?
      0
    elsif courses.class == Course
      courses.credit
    else
      res = 0
      courses.each do |c|
        res += c.credit.to_i
      end
      res
    end
  end
end
