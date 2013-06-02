Then /^I should see a message indicating that i have errors on page$/ do
  page.should have_content("error")
end

Then /^I should see that the "(.*)" of "(.*)" needs to be corrected$/ do |field,noun|
  page.has_css?("div.field_with_errors ##{noun}_#{field}").should == true
end

