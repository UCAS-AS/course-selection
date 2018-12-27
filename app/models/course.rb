class Course < ApplicationRecord
  belongs_to :department
  has_many :teach_relationship, foreign_key: 'course', dependent: :destroy
  has_many :teachers, through: :teach_relationship, source: :teacher
  has_many :select_relationship, foreign_key: 'course', dependent: :destroy
  has_many :students, through: :select_relationship, source: :student

  def add_student(student)
    students << student
  end

  def remove_student(student)
    students.delete student
  end

end
