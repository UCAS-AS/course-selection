class SelectRelationship < ApplicationRecord
  belongs_to :student, class_name: 'Student'
  belongs_to :course, class_name: 'Course'
  validates :course, presence: true
  validates :student, presence: true
end
