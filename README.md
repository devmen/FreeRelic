# FreeRelic


## Installion

Installion steps for contributors:
    rvm install 1.9.2
    rvm use 1.9.2@free_relic --create
    gem build free_relic.gemspec
    gem install free_relic-0.0.1.gem

## Usage

Add to application Gemfile:
    gem "free_relic", :git => "https://github.com/devmen/FreeRelic.git"
and run
    $ bundle install

Run application and go to /free_relic/

Sample application here https://github.com/devmen/FreeRelicTest


## Running Tests

Run the tests
    rake spec


## Contributing to FreeRelic

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but $


## Homepage

https://github.com/devmen/FreeRelic


## Copyright

Copyright (c) 2011 devmen.com, released under the MIT license

