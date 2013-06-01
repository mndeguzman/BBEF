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
  fill_in "student_last_name",         with: student_values_to_fill_in['Last Name']
  fill_in "student_dob",         with: student_values_to_fill_in['DOB']
  fill_in "student_grade",         with: student_values_to_fill_in['Grade']
  fill_in "student_institute",         with: student_values_to_fill_in['Institute']
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
  page.find("#student_dob").value.should ==  student_values_to_fill_in['DOB']
  page.find("#student_grade").value.should ==  student_values_to_fill_in['Grade']
  page.find("#student_institute").value.should == student_values_to_fill_in['Institute']

end


Then(/^I enter and save the following details of a student$/) do |required_values|
  student_values_to_fill_in = required_values.rows_hash

  fill_in "student_first_name",         with: student_values_to_fill_in['First Name'] if student_values_to_fill_in['First Name'] 
  fill_in "student_last_name",         with: student_values_to_fill_in['Last Name'] if student_values_to_fill_in['Last Name'] 
  fill_in "student_dob",         with: student_values_to_fill_in['DOB'] if student_values_to_fill_in['DOB'] 
  fill_in "student_grade",         with: student_values_to_fill_in['Grade'] if student_values_to_fill_in['Grade'] 
  fill_in "student_institute",         with: student_values_to_fill_in['Institute'] if student_values_to_fill_in['Institute'] 
  click_button "save_student"
end
