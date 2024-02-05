class School < ApplicationRecord
  has_many :students
  has_many :school_classes

  validates :name, presence: true, uniqueness: true
end
