class ApplicationController < ActionController::Base
  protect_from_forgery

  USERNAME = "bbefuser"
  PASSWORD = "bbefuserpass"
  http_basic_authenticate_with :name => USERNAME, :password => PASSWORD
end
