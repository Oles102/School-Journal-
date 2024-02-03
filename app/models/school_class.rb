class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :students, class_name: 'Student'

  validates :number, :letter, :students_count, :school_id, presence: true
end
