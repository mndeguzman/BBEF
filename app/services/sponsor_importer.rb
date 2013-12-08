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
    first_name, last_name, bbef_id,organisation,sponsor_type, address,
    city, state,zip,country,current_bal, date_paid, 
    contact_method,email_address,phone_number,mobile= row

    puts "row #{row}"
    puts "current_bal #{current_bal}"
    date_paid_as_date = date_paid.blank? ? nil : Date.strptime(date_paid.strip, '%d/%m/%y') 
    Sponsor.create!(current_balance: current_bal.blank? ? nil : current_bal.gsub('$','').strip,
                  bbef_id: current_bal.blank? ? nil : bbef_id.strip,
                  date_paid:  date_paid_as_date,
                  first_name: first_name.blank? ? 'UNKNOWN' : first_name.strip,
                  last_name: last_name.blank? ? 'UNKNOWN' : last_name.strip,
                  address: address.blank? ? 'UNKNOWN' : address.strip,
                  city: city.blank? ? 'UNKNOWN' : city.strip.to_s,
                  state: state.blank? ? 'UNKNOWN' : state.strip.to_s,
                  postcode: zip.blank? ? 'UNKNOWN' : zip.strip,
                  organisation: organisation.blank? ? nil : organisation,
                  country: country.blank? ? 'UNKNOWN' : country.strip,
                  sponsor_type: sponsor_type.blank? ? 'UNKNOWN' : sponsor_type.strip,
                  email: email_address.blank? ? nil : email_address.strip,
                  contact_method: contact_method.blank? ? nil : contact_method.strip,
                  home_phone: phone_number.blank? ? nil : phone_number.strip,
                  mobile: mobile.blank? ? nil : mobile.strip )
  end

end