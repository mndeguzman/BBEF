require 'csv'
module StudentImporter

def self.process_csv(csv)
    nb_line_processed = -1
    nb_errors = 0
    things_added = -1
    error_messages = []
  	Student.delete_all
    CSV.foreach(csv) do |row|
		nb_line_processed = nb_line_processed +1
		begin
			create_student_from_csv_row(row)
			things_added = things_added+1
		rescue Exception => exception
      puts "\n\n Error while importing student " + exception.inspect
      puts "Backtrace:\n\t#{exception.backtrace.join("\n\t")}"
			nb_errors = nb_errors+1
			error_messages << "* lines #{nb_line_processed} did not process" if error_messages.size < 5
		end
	end
    result = {}
    result[:errors] = nb_errors
    result[:added] = things_added
    result[:error_messages] = error_messages
    result
  end

  def self.create_student_from_csv_row(row)
    given_name, middle_name,last_name, date_of_birth,sex,
    grade, school_collage, collage_course,program_start_date,program_end_date,post_program_career, years_sponsored,sponsor = row
    #puts "program_start_date #{program_start_date}"
    dob_as_date = date_of_birth.blank? ? nil : Date.strptime(date_of_birth.strip, '%d/%m/%y') 
    program_start_as_date = program_start_date.blank? ? nil : Date.strptime(program_start_date.strip, '%d/%m/%y') 
    program_end_as_date = program_end_date.blank? ? nil : Date.strptime(program_end_date.strip, '%d/%m/%y') 

    sponsor = sponsor.blank? ? nil:  Sponsor.find_by_bbef_id(sponsor.strip) 


    Student.create!(first_name: given_name.blank? ? nil : given_name.strip,
                  last_name: last_name.blank? ? nil : last_name.strip ,
                  middle_name: middle_name.blank? ? nil : middle_name.strip ,
                  grade: grade.blank? ? 'UNKNOWN' : grade.strip,
                  institute: school_collage.blank? ? 'UNKNOWN' : school_collage.strip.to_s,
                  course_type: collage_course.blank? ? nil : collage_course.strip.to_s,
                  sex: sex.blank? ? nil : sex.strip,
                  dob: dob_as_date,
                  program_start: program_start_as_date,
                  program_end: program_end_as_date,
                  sponsor: sponsor)
  end



end