bundle install
rake db:reset 
rake db:migrate
rake db:test:prepare
cucumber

