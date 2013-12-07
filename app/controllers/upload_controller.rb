class UploadController < ApplicationController

	def view_upload

	end

	def upload
    	Specialisation.delete_all
    	ActiveRecord::Base.connection.execute("TRUNCATE TABLE programs_units")
    	ActiveRecord::Base.connection.execute("TRUNCATE TABLE majors_units")
     	process_csv(params[:csv].tempfile, params[:type])
	end



  def process_csv(csv,type)
    nb_line_processed = -1
    nb_errors = 0
    things_added = -1
    error_messages = []

    if type = "Sponsor" 
    	ActiveRecord::Base.connection.execute("TRUNCATE TABLE sponsors")
	    CSV.foreach(csv) do |row|
			nb_line_processed = nb_line_processed +1
			begin
				create_sponsor_from_csv_row(row)
				things_added = things_added+1
			rescue
				nb_errors = nb_errors+1
				error_messages << "* line #{nb_line_processed} (Code: #{self.code_from_row(row)})" if error_messages.size < 5
			end
  	  end
	elsif type = "Student" 
    	#ActiveRecord::Base.connection.execute("TRUNCATE TABLE students")
	    #CSV.foreach(csv) do |row|
		#	nb_line_processed = nb_line_processed +1
		#	begin
		#		create_sponsor_from_csv_row(row)
		#		things_added = things_added+1
		#	rescue
		#		nb_errors = nb_errors+1
		#		error_messages << "* line #{nb_line_processed} (Code: #{self.code_from_row(row)})" if error_messages.size < 5
		#	end
  	    #end		

	end
    result = {}
    result[:errors] = nb_errors
    result[:added] = things_added
    result[:error_messages] = error_messages
    result
  end


  def self.create_sponsor_from_csv_row(row)
    first_name, last_name, organisation, address, city, state,zip,country current_bal, date_paid, contact_method,sent_letter,email_address= row
    begin
      transaction do
        StockItem.create!(current_balance: Float(from_currency(total_value.strip)).to_s,
                      date_paid: brand.strip,
                      first_name: first_name.strip,
                      last_name: last_name.strip,
                      address: address.strip,
                      city: city.strip.to_s,
                      state: state.strip.to_s,
                      postcode: zip.strip,
                      email: email_address.strip,
                      contact_method: contact_method.strip)
      end
    end
  end

	end
end	