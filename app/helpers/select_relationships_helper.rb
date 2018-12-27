module SelectRelationshipsHelper

  def is_degree_course(student, course)
    SelectRelationship.find_by(student_id: student.id, course_id: course.id).is_degree_course
  end

  def get_grade(student, course)
    grade = SelectRelationship.find_by(student_id: student.id, course_id: course.id).grade
  end
end
