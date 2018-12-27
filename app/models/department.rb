class Department < ApplicationRecord
  has_many :students
  has_many :teachers
  has_many :courses
end
