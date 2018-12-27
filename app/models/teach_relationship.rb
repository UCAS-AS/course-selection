class TeachRelationship < ApplicationRecord
  belongs_to :teacher, class_name: 'Teacher'
  belongs_to :course, class_name: 'Course'
  validates :course, presence: true
  validates :teacher, presence: true
end
