When /^I view the list of students$/ do
  visit students_path
end

Then /^I shall see the following students$/  do |expected_students|
	TableHelper.compareTable(expected_students,["Name","DOB","Grade","Institute"],"student",page)
end

When /^I choose to add a student$/ do
  click_link "student_create_link"
end

When /^I attempt to create a student with the following values$/ do |required_values|

  student_values_to_fill_in = required_values.rows_hash

  fill_in "student_first_name",         with: student_values_to_fill_in['First Name']
  fill_in "student_last_name",          with: student_values_to_fill_in['Last Name']
  student_values_to_fill_in['DOB'] =~ /(.*)\/(.*)\/(.*)/
  select $1.to_s,                       from: "student_dob_3i" if student_values_to_fill_in['DOB'] 
  select Date::MONTHNAMES[$2.to_i],     from: "student_dob_2i" if student_values_to_fill_in['DOB'] 
  select $3.to_s,                       from: "student_dob_1i" if student_values_to_fill_in['DOB'] 
  fill_in "student_grade",              with: student_values_to_fill_in['Grade']
  fill_in "student_institute",          with: student_values_to_fill_in['Institute']
  click_button "create_student"

end

When(/^I choose to view the student "(.*?)"$/) do |student_name|
  click_link student_name
end

Then(/^I see the following details of a student$/) do |expected_values|
  student_values_to_fill_in = expected_values.rows_hash

  page.find("#student_name").text.should == student_values_to_fill_in['Name'] if student_values_to_fill_in['Name']
  page.find("#student_dob").text.should == student_values_to_fill_in['DOB'] if student_values_to_fill_in['DOB']
  page.find("#student_grade").text.should == student_values_to_fill_in['Grade'] if student_values_to_fill_in['Grade']
  page.find("#student_institute").text.should == student_values_to_fill_in['Institute'] if student_values_to_fill_in['Institute']

end

When(/^I choose to edit the current student$/) do
  click_link "edit_student_link"
end

Then(/^I see prepopulated the details of a student$/) do |expected_values|
  student_values_to_fill_in = expected_values.rows_hash

  page.find("#student_first_name").value.should ==  student_values_to_fill_in['First Name']
  page.find("#student_last_name").value.should == student_values_to_fill_in['Last Name']
  student_values_to_fill_in['DOB'] =~ /(.*)\/(.*)\/(.*)/
  select $1.to_s,                       from: "student_dob_3i" if student_values_to_fill_in['DOB'] 
  select Date::MONTHNAMES[$2.to_i],     from: "student_dob_2i" if student_values_to_fill_in['DOB'] 
  select $3.to_s,                       from: "student_dob_1i" if student_values_to_fill_in['DOB'] 
  page.find("#student_grade").value.should ==  student_values_to_fill_in['Grade']
  page.find("#student_institute").value.should == student_values_to_fill_in['Institute']

end


Then(/^I enter and save the following details of a student$/) do |required_values|
  student_values_to_fill_in = required_values.rows_hash

  fill_in "student_first_name",         with: student_values_to_fill_in['First Name'] if student_values_to_fill_in['First Name'] 
  fill_in "student_last_name",         with: student_values_to_fill_in['Last Name'] if student_values_to_fill_in['Last Name'] 
  student_values_to_fill_in['DOB'] =~ /(.*)\/(.*)\/(.*)/
  select $1.to_s,                       from: "student_dob_3i" if student_values_to_fill_in['DOB'] 
  select Date::MONTHNAMES[$2.to_i],     from: "student_dob_2i" if student_values_to_fill_in['DOB'] 
  select $3.to_s,                       from: "student_dob_1i" if student_values_to_fill_in['DOB'] 
  fill_in "student_grade",         with: student_values_to_fill_in['Grade'] if student_values_to_fill_in['Grade'] 
  fill_in "student_institute",         with: student_values_to_fill_in['Institute'] if student_values_to_fill_in['Institute'] 
  click_button "save_student"
end

When(/^I choose to cancel the current action$/) do
  click_link "Cancel"
end

When(/^I should be viewing the student list$/) do
  TableHelper.assert_table_is_present("student",page)
end

When(/^I should be viewing the student details$/) do
  page.find("#student_details").nil?.should == false
end
