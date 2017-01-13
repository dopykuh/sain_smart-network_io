# SainSmart::NetworkIO

This gem provides a ruby frontend for SainSmart 16CH Relaycard, 
currently supported are only Network v2/v1 shields.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sain_smart-network_IO'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sain_smart-network_IO

## Usage


```ruby
  # get net relay instance (IP: "192.168.1.4")
  r = SainSmart::NetworkIO::Relay.new(type: "16CH")
  ch = r.channel(<Int>) # Get channel object
  ch.on?  # Is on? -> v2 only
  ch.off? # Is off? -> v2 only
  r.channels.each(&:on!)  # Enable all
  r.channels.each(&:off!) # Disable all
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

