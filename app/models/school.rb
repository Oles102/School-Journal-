class School < ApplicationRecord
  has_many :students, class_name: 'Student'
  has_many :school_classes, class_name: 'SchoolClass'

  validates :name, presence: true, uniqueness: true
end
