When /^I choose to associate the sponsor "(.*?)" with the current student$/ do |sponsor_name|	
	sponsor_name =~ /(.*) (.*)/
    first_name = $1
    sponsor = Sponsor.find_by_first_name first_name

    sponsor_string_as_displayed = "#{sponsor.full_name} (#{sponsor.postcode})"

    page.select(sponsor_string_as_displayed, :from => "sponsor_name")


    click_button "associate_sponsor"
end

Then /^the student "(.*?)" is associated with sponsor "(.*?)"$/ do |student_name, sponsor_name|
	student_name =~ /(.*) (.*)/
    first_name = $1
    student = Student.find_by_first_name first_name

    "#{student.sponsor.first_name} #{student.sponsor.last_name}".should == sponsor_name
end

Then /^the current student is associated with "(.*?)"$/ do |expected_sponsor|
	expected_sponsor =~ /(.*) (.*)/
    first_name = $1
    sponsor = Sponsor.find_by_first_name first_name

    page.has_select?("#sponsor_name", selected: sponsor.id)
end

When /^I choose to view the sponsor of "(.*?)"$/  do |student_name|
	student_name =~ /(.*) (.*)/
    first_name = $1
    student = Student.find_by_first_name first_name

    page.find("##{student.id} .sponsor_name a").click

end


When /^I can associate the student with$/ do |expected_sponsors|
   allowed_values = []
   expected_sponsors.hashes.each do | row| 
   	allowed_values << row["sponsor"]
   end	
   page.has_select?("#sponsor_name", options: allowed_values)
end


Then /^I print out the students and the sponsers$/ do 	
  Student.find(:all).each do |student|
  	pp student
  end

  Sponsor.find(:all).each do |sponsor|
  	pp sponsor
  end
end