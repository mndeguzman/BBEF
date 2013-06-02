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

  { 
    first_name: "First Name", 
    last_name: "Last Name", 
    current_balance: "Current Balance", 
    date_paid: "Date Paid", 
    address: 'Addresss', 
    city: 'City', 
    state: 'State', 
    postcode: 'Postcode'
    }.each do |field, title|
    fill_in "sponsor_#{field}", with: sponsor_form_values[title] if sponsor_form_values[title] 
  end

  click_button "create_sponsor"
end

When(/^I choose to view the sponsor "(.*?)"$/) do |sponsor_name|
  click_link sponsor_name
end

Then(/^I see the following details of a sponsor$/) do |expected_values|
  sponsor_values_to_fill_in = expected_values.rows_hash

  { 
    name: "Name", 
    current_balance: "Current Balance", 
    date_paid: "Date Paid", 
    address: 'Addresss', 
    city: 'City', 
    state: 'State', 
    postcode: 'Postcode'
    }.each do |field, title|
    page.find("#sponsor_#{field}").text.should == sponsor_values_to_fill_in[title] if sponsor_values_to_fill_in[title]
  end

end

When(/^I choose to edit the current sponsor$/) do
  click_link "edit_sponsor_link"
end

Then(/^I see prepopulated the details of a sponsor$/) do |expected_values|
  sponsor_values_to_fill_in = expected_values.rows_hash

  { 
    first_name: "First Name", 
    last_name: "Last Name", 
    current_balance: "Current Balance", 
    date_paid: "Date Paid", 
    address: 'Addresss', 
    city: 'City', 
    state: 'State', 
    postcode: 'Postcode'
    }.each do |field, title|
    page.find("#sponsor_#{field}").value.should == sponsor_values_to_fill_in[title] if sponsor_values_to_fill_in[title]
  end
end


Then(/^I enter and save the following details of a sponsor$/) do |expected_values|
  sponsor_form_values = expected_values.rows_hash

  { 
    first_name: "First Name", 
    last_name: "Last Name", 
    current_balance: "Current Balance", 
    date_paid: "Date Paid", 
    address: 'Addresss', 
    city: 'City', 
    state: 'State', 
    postcode: 'Postcode'
    }.each do |field, title|
    fill_in "sponsor_#{field}", with: sponsor_form_values[title] if sponsor_form_values[title] 
  end
  
  click_button "save_sponsor"
end

Then(/^I am viewing the sponsor "(.*?)"$/) do |expected_sponsor|
  page.find("#sponsor_name").text.should == expected_sponsor
end