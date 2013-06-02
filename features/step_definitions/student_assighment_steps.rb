When /^I choose to associate the sponsor "(.*?)" with the current student$/ do |sponsor_name|	
  fill_in "sponsor_name",         with: sponsor_name

  click_button "associate_sponsor"
end

Then /^the student "(.*?)" is associated with sponsor "(.*?)"$/ do |student_name, sponsor_name|
	student_name =~ /(.*) (.*)/
    first_name = $1
    student = Student.find_by_first_name first_name

    "#{student.sponsor.first_name} #{student.sponsor.last_name}".should == sponsor_name
end

Then /^I print out the students and the sponsers$/ do 	
  Student.find(:all).each do |student|
  	pp student
  end

  Sponsor.find(:all).each do |sponsor|
  	pp sponsor
  end
end