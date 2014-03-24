# Activerecord::HumanizedErrors

Adds humanized error messages to ActiveRecord models, not rocket science at all.

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-humanized_errors'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-humanized_errors

## Usage

Let's say, you have a model like this:

```ruby
    class User < ActiveRecord::Base
       validates_presence_of :name, :email
    end
```

Then, on rails console you attempt to create a new user:

    Loading development environment (Rails 4.0.3)
    irb(main):001:0> User.create
      (0.2ms)  BEGIN
      (0.2ms)  ROLLBACK
    => #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>

Now you can make use of the humanized_errors method:

    irb(main):002:0> _.humanized_errors
    => "Name can't be blank, Email can't be blank"

## Compatibility

Preferred used on rails or activerecord >= 4

Supports rails 2.3.18+, locking to [v1.1.x](../../releases/tag/v1.1.0)

## Contributing

1. Fork it ( http://github.com/joiggama/activerecord-humanized_errors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
