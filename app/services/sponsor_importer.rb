require 'csv'
module SponsorImporter

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
      puts "\n\n Error while importing sponsor " + exception.inspect
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


  def self.create_sponsor_from_csv_row(row)
    first_name, last_name, bbef_id,organisation,sponsor_type, address, city, state,zip,country,current_bal, date_paid,paid_up_2014, contact_method,sent_letter,email_address,phone_number,mobile= row
    puts "row #{row}"
    puts "date_paid.strip #{date_paid.strip}"
    date_paid_as_date = date_paid.blank? ? nil : Date.strptime(date_paid.strip, '%d/%m/%y') 
    Sponsor.create!(current_balance: current_bal.strip,
                  date_paid: date_paid_as_date,
                  first_name: first_name.strip,
                  last_name: last_name.strip,
                  address: address.strip,
                  city: city.strip.to_s,
                  state: state.strip.to_s,
                  postcode: zip.strip,
                  email: email_address.strip,
                  contact_method: contact_method.strip,
                  home_phone:phone_number,
                  mobile: mobile )
  end

end