When(/^I view the list of sponsors$/) do
  visit sponsors_path
end

Then(/^I shall see the following sponsors$/) do |sponsors|
  TableHelper.compareTable(sponsors,[ "Name", "Current Balance", "Date Paid" ],"sponsor", page)
end