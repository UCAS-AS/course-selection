class Student < ApplicationRecord
  include User

  # Relationships
  belongs_to :department
  has_many :select_relationships, foreign_key: 'student_id', dependent: :destroy
  has_many :courses, through: :select_relationships

  # Attribute accessor
  attr_accessor :remember_token, :email_activation_token, :reset_token

  # Validations
  validates :email,
            presence: true,
            length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password,
            presence: true,
            length: {minimum: 8, maximum: 16}
  has_secure_password

  def select(course)
    courses << course
  end

  def un_select(course)
    courses.delete course
  end

  def set_degree_course(course)
    @select = SelectRelationship.find_by(student_id: self.id, course_id: course.id)
    p @select
    @select.update_attribute(:is_degree_course, true)
  end

  def un_set_degree_course(course)
    @select = SelectRelationship.find_by(student_id: self.id, course_id: course.id)
    @select.update_attribute(:is_degree_course, false)
  end



end

