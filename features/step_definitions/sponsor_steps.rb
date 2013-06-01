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
