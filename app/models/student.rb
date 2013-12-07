class Student < ActiveRecord::Base
  attr_accessible  :dob, :first_name, :grade, :num_year, :institute, :last_name, :program_end, :program_start, :sex, :number_of_years_in_collage , :course_type, :sponsor_id
  belongs_to :sponsor


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true
  validates :institute, presence: true
  validates :sex, presence: true

  GENDER_MALE = "MALE"
  GENDER_FEMALE = "FEMALE"

  def full_name
  	"#{first_name} #{last_name}"
  end
end
