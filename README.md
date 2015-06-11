# hubspot-api

This gem aims to support all of the Hubspot APIs in an ActiveModel-compliant
manner.  It also gives Hubspot portals first-class status.  This is important
for use cases involving API calls against multiple portals.  Thread safety is
also a priority.

Right now only api key authentication and v1 of the APIs are supported.

## Dependencies

* faraday
* faraday-middleware

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hubspot-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hubspot-api

## Usage

TBD

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake rspec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/keithlayne/hubspot-api.

