Given(/^I pause$/) do
  gets
end	

Given /^I have landed on BBEF hompage$/ do

  if Capybara::current_driver == :selenium
    visit("http://#{ApplicationController::USERNAME}:#{ApplicationController::PASSWORD}@#{page.driver.rack_server.host}:#{page.driver.rack_server.port}/")
  else
    encoded_login = ["#{ApplicationController::USERNAME}:#{ApplicationController::PASSWORD}"].pack("m*")
    page.driver.header 'Authorization', "Basic #{encoded_login}"
    visit "/"
  end
end