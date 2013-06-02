class Student < ActiveRecord::Base
  attr_accessible :course, :dob, :first_name, :grade, :institute, :last_name, :num_year, :program_end, :program_start, :sex,:sponsor
  belongs_to :sponsor


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true
  validates :institute, presence: true

end
