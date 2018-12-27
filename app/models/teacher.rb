class Teacher < ApplicationRecord
  include User

  # Relationships
  belongs_to :department
  has_many :teach_relationships, foreign_key: 'teacher_id', dependent: :destroy
  has_many :courses, through: :teach_relationships

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

  def teach(course)
    courses << course
  end

  def un_teach(course)
    courses.delete course
  end



end
