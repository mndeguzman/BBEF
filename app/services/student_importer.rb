require 'csv'
module StudentImporter

def self.process_csv(csv)
    nb_line_processed = -1
    nb_errors = 0
    things_added = -1
    error_messages = []
  	Sponsor.delete_all
    CSV.foreach(csv) do |row|
		nb_line_processed = nb_line_processed +1
		begin
			create_sponsor_from_csv_row(row)
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

 attr_accessible  :dob, :first_name, :grade, :num_year, :institute, :last_name, :program_end, :program_start, :sex, :number_of_years_in_collage , :course_type, :sponsor_id, :thumbnail
 

  def self.create_student_from_csv_row(row)
    given_name, middle_name,last_name, date_of_birth,sex,
    grade, school_collage, collage_course, program_start_date,program_end_date,post_program_career, years_sponsored = row
    dob_as_date = dob.blank? ? nil : Date.strptime(date_paid.strip, '%d/%m/%y') 
    program_start_as_date = date_paid.blank? ? nil : Date.strptime(date_paid.strip, '%d/%m/%y') 
    program_end_as_date = date_paid.blank? ? nil : Date.strptime(date_paid.strip, '%d/%m/%y') 
    Sponsor.create!(first_name: given_name.strip,
                  last_name: last_name.strip,
                  first_name: first_name.strip,
                  grade: grade.strip,
                  num_year: years_sponsored.strip,
                  school_collage: school_collage.strip.to_s,
                  course_type: collage_course.strip.to_s,
                  sex: sex.strip,
                  dob: email_address.strip,
                  program_start: contact_method.strip,
                  program_end:phone_number)
  end



end