class Student < ActiveRecord::Base

  attr_accessible  :dob, :first_name, :grade, :institute, :last_name, :program_end , :middle_name
  attr_accessible :program_start, :sex, :number_of_years_in_collage , :course_type,:sponsor, :sponsor_id, :post_program
  attr_accessible :photo, :thumbnail

  belongs_to :sponsor


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true
  validates :institute, presence: true
  validates :sex, presence: true

  GENDER_MALE = "MALE"
  GENDER_FEMALE = "FEMALE"

  def full_name
  	"#{first_name} #{middle_name} #{last_name}".gsub('  ',' ')
  end
end
