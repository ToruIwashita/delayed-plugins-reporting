# Delayed::Plugins::Reporting

[![Code Climate](https://codeclimate.com/github/crowdworks/delayed-plugins-reporting/badges/gpa.svg)](https://codeclimate.com/github/crowdworks/delayed-plugins-reporting)

A [Delayed::Job](https://github.com/collectiveidea/delayed_job) plugin to report lifecycle events like job invocations,
failures, retries to log files or monitoring services like Datadog.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'delayed-plugins-reporting'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delayed-plugins-reporting

## Usage

```ruby
require 'delayed-plugins-reporting'
require 'delayed-plugins-reporting-<reporting plugin of your choice>'

# Configure the plugin like so:
Delayed::Plugins::Reporting.options = {
  reporter: {
    class: Delayed::Plugins::Reporting::DatadogJobReporter,
    prefix: 'crowdworks.delayed_job.lifecycle'
  }
}

# Register the plugin like so:
Delayed::Worker.plugins << Delayed::Plugins::Reporting
```

## Contributing

1. Fork it ( https://github.com/crowdworks/delayed-plugins-reporting/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
