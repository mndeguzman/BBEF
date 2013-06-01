When /^I view the list of students$/ do
  visit students_path
end

Then /^I shall see the following students$/  do |expected_students|
	TableHelper.compareTable(expected_students,["Name"],"student",page)
end
