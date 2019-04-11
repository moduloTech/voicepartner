# Voicepartner

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/voicepartner`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'voicepartner', '~> 0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voicepartner

## Usage

Configure with
```ruby
Voicepartner.configure do |config|
  # This is just a suggestion YourCredentialsRepository can be anything
  #   you can just initialize YourCredentialsRepository with ENV, like this
  #   YourCredentialsRepository = ENV
  config.api_key = YourCredentialsRepository.fetch('VOICE_PARTNER_API_KEY')
end
```

Use like
```ruby
res = Voicepartner.send_vocal_message(
  to:           '0623456789',
  message_text: 'Test from Voicepartner gem'
)

if res.success
  puts  res.raw_response,
        res.rate_limit,
        res.rate_limit.limit.parsed,
        res.rate_limit.limit.raw,
        res.rate_limit.remaining.parsed,
        res.rate_limit.remaining.raw,
        res.rate_limit.resets_at.parsed,
        res.rate_limit.resets_at.raw
else
  warn  res.raw_response.error
end
```

## Development

Don't forget to create `.rspec_api_key` and `.rspec_number` to use your api key and a phone number for using the test suite.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/voicepartner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Voicepartner project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/voicepartner/blob/master/CODE_OF_CONDUCT.md).
