BBEF
====
[![Build Status](https://travis-ci.org/mndeguzman/BBEF.png)](https://travis-ci.org/mndeguzman/BBEF.png)

Dev Notes
---------------

* Test sequence:
```
bundle exec rake db:reset
bundle exec rake db:migrate
bundle exec rake db:test:prepare
bundle exec cucumber
```

* Run sequence: `rails s`
* List of Rake commands: `rake -T`
