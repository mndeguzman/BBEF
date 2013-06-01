class Student < ActiveRecord::Base
  attr_accessible :course, :dob, :first_name, :grade, :institute, :last_name, :num_year, :program_end, :program_start, :sex
end
