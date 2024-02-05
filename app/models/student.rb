class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :school
  belongs_to :school_class

  validates :first_name, :last_name, :surname, presence: true

  after_create :increment_student_count
  after_destroy :decrement_student_count

  private

  def increment_student_count
    school_class.increment!(:students_count)
  end
  def decrement_student_count
    school_class.decrement!(:students_count)
  end
end
