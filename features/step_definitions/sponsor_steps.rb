When(/^I view the list of sponsors$/) do
	visit sponsors_path
end

Then(/^I shall see the following sponsors$/) do |sponsors|
	TableHelper.compareTable(sponsors,[ "Name", "Current Balance", "Date Paid" ],"sponsor", page)
end


When /^I choose to add a sponsor$/ do
  click_link "sponsor_create_link"
end

When /^I attempt to create a sponsor with the following values$/ do | form_values |
  sponsor_form_values = form_values.rows_hash

  fill_in "sponsor_first_name",      with: sponsor_form_values['First Name']
  fill_in "sponsor_last_name",       with: sponsor_form_values['Last Name']
  fill_in "sponsor_current_balance", with: sponsor_form_values['Current Balance']
  fill_in "sponsor_date_paid",       with: sponsor_form_values['Date Paid']

  click_button "create_sponsor"
end

When(/^I choose to view the sponsor "(.*?)"$/) do |sponsor_name|
  click_link sponsor_name
end

Then(/^I see the following details of a sponsor$/) do |expected_values|
  sponsor_values_to_fill_in = expected_values.rows_hash

  page.find("#sponsor_name").text.should == sponsor_values_to_fill_in['Name'] if sponsor_values_to_fill_in['Name']
  page.find("#sponsor_current_balance").text.should == sponsor_values_to_fill_in['Current Balance'] if sponsor_values_to_fill_in['Current Balance']
  page.find("#sponsor_date_paid").text.should == sponsor_values_to_fill_in['Date Paid'] if sponsor_values_to_fill_in['Date Paid']

end

When(/^I choose to edit the current sponsor$/) do
  click_link "edit_sponsor_link"
end

Then(/^I see prepopulated the details of a sponsor$/) do |expected_values|
  sponsor_values_to_fill_in = expected_values.rows_hash

  page.find("#sponsor_first_name").value.should ==  sponsor_values_to_fill_in['First Name']
  page.find("#sponsor_last_name").value.should == sponsor_values_to_fill_in['Last Name']
  page.find("#sponsor_current_balance").value.should == sponsor_values_to_fill_in['Current Balance'] if sponsor_values_to_fill_in['Current Balance']
  page.find("#sponsor_date_paid").value.should == sponsor_values_to_fill_in['Date Paid'] if sponsor_values_to_fill_in['Date Paid']
end


Then(/^I enter and save the following details of a sponsor$/) do |expected_values|
  sponsor_form_values = expected_values.rows_hash

  fill_in "sponsor_first_name",         with: sponsor_form_values['First Name'] if sponsor_form_values['First Name'] 
  fill_in "sponsor_last_name",         with: sponsor_form_values['Last Name'] if sponsor_form_values['Last Name'] 
  fill_in "sponsor_current_balance", with: sponsor_form_values['Current Balance'] if sponsor_form_values['Current Balance'] 
  fill_in "sponsor_date_paid",       with: sponsor_form_values['Date Paid'] if sponsor_form_values['Date Paid'] 
  
  click_button "save_sponsor"
end

Then(/^I am viewing the sponsor "(.*?)"$/) do |expected_sponsor|
  page.find("#sponsor_name").text.should == expected_sponsor
end