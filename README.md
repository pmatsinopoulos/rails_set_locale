# RailsSetLocale

I always find myself writing the same code again and again, about setting the current locale for my Rails applications. Will this
gem here help me write only once?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_set_locale'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_set_locale

## Usage

### Setting the Locale By Reading Various Runtime Parameters

You application controller needs to include the module:

```
class ApplicationController < ActionController::Base
  # ...
  include RailsSetLocale
  # ...
end
```

This will install a `before_action` hook on method `set_locale` that is already implemented by the `RailsSetLocale` module.

That is enough!

Note that the gem is still in progress. Currently, it specifies the locale from the `Accept-Language` HTTP request header and
it saves it in the session. I plan to expand the functionality of this gem to pick up the locale from the `current_user.locale`
or from whatever the hosting application wants the locale specification to be.

### Setting the Locale Using /set_locale end-point

You can set the locale by letting your users visiting the URL:

`/set_locale`

with param `locale` specifying the new locale. You need to give, also, the `return_back_to` URL because the controller
that is setting the locale needs to know where to redirect to.

For example:

`/set_locale?locale=el&return_back_to=/`

will set the locale to the Greek locale and redirect to `/`.

The controller implemented by the `RailsSetLocale` gem, is setting the `session[:locale]` to the locale requested.

In order to implement this feature, you will have to mount the `RailsSetLocale` engine. In your routes include this:

``` ruby
mount RailsSetLocale::Engine => "/set_locale", as: :set_locale
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake` to run `rubocop` and tests. 
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, 
and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, 
and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_set_locale. 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the 
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsSetLocale project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the 
[code of conduct](https://github.com/[USERNAME]/rails_set_locale/blob/master/CODE_OF_CONDUCT.md).
