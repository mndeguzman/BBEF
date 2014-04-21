require 'csv'
module SponsorImporter

def self.process_csv(csv)
    nb_line_processed = -1
    number_of_errors = 0
    things_added = -1
    error_messages = []
  	Sponsor.delete_all
    CSV.foreach(csv, headers: :first_row,:header_converters => :symbol) do |row|
		nb_line_processed = nb_line_processed +1
		begin
			create_sponsor_from_csv_row(row)
			things_added = things_added+1
		rescue Exception => exception
      puts "\n\n Error while importing sponsor " + exception.inspect
      puts "Backtrace:\n\t#{exception.backtrace.join("\n\t")}"
			number_of_errors = number_of_errors+1
			error_messages << "* line #{nb_line_processed+2} did not process because #{exception.message}" if error_messages.size < 5
		end
	end
    result = {}
    result[:errors] = number_of_errors
    result[:added] = things_added
    result[:error_messages] = error_messages
    result
  end

#sponsorfirstname  sponsorlastname id  organisation  sponsortype address city  state zip country full address  currentbal$ datepaid  paidupto2014  contactmethod sent letter?  emailaddress  phno  mobile                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          



  def self.create_sponsor_from_csv_row(row)
    first_name=row[:sponsorfirstname]
    last_name=row[:sponsorlastname]
    bbef_id=row[:id]
    organisation=row[:organisation]
    sponsor_type=row[:sponsortype]
    address=row[:address]
    city=row[:city]
    state=row[:state]
    zip=row[:zip]
    country=row[:country]
    current_bal=row[:currentbal]
    date_paid=row[:datepaid]
    contact_method=row[:contactmethod]
    email_address=row[:emailaddress]
    phone_number=row[:phno]
    mobile=row[:mobile]

    puts "row #{row}"
    puts "current_bal #{current_bal}"
    email_regex = /^([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|@|\?|\.|\^|_|`|\{|\||\}|~)*$/
  
    unless email_address.blank?
      email_address.downcase!
      match = email_regex.match(email_address)
      unless match
        raise "'#{email_address}' is not a valid email adress"
      end
    end 
    date_paid_as_date = date_paid.blank? ? nil : Date.strptime(date_paid.strip, '%d/%m/%y') 
    Sponsor.create!(current_balance: current_bal.blank? ? nil : current_bal.gsub('$','').strip,
                  bbef_id: bbef_id.blank? ? nil : bbef_id.strip,
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
                  contact_method: contact_method.blank? ? 'UNKNOWN' : contact_method.strip,
                  home_phone: phone_number.blank? ? nil : phone_number.strip,
                  mobile: mobile.blank? ? nil : mobile.strip )
    
  end

end