# SuperCurrent
`SuperCurrent` takes away the need to define a `Current` class and instead makes it available from anywhere in your app without having to define it. 

This means that your test coverage will not suffer from `ActiveSupport::CurrentAttributes`!

You can define the class name of the `Current` class, so if you're already using `Current` for something else, you can use a different name.

```ruby
# config/initializers/super_current.rb
SuperCurrent.config.current_class_name = 'SuperCurrent'
```

Then you can have your existing `Current` class be a subclass of `SuperCurrent` and it will still work with all the exciting features of `SuperCurrent`.

```ruby
class Current < SuperCurrent
  # ...
end
```

## Usage
Just think up a name for your attribute and assign it! It will be created on the `Current` class automatically. 

```ruby
Current.foo = 'bar'
Current.foo # => 'bar'
```

`SuperCurrent` also adds the ability to use `[]` and `[]=` to access the attributes.

```ruby
Current[:foo] = 'bar'
Current[:foo] # => 'bar'
```

Even something like `Current[:foo][:bar]` will work!

```ruby
# No need to define Current[:hoge] beforehand!
Current[:hoge][:bar] = "hello"
Current[:hoge][:bar] # => 'bar'
```

This means that you no longer need to define the attributes on the `Current` class beforehand. 

So if you have a class like this:

```ruby
class Current < ActiveSupport::CurrentAttributes
  attribute :foo
  attribute :bar
  attribute :baz
  attribute :hoge
end
```

You can just delete it and enjoy the benefits of `SuperCurrent`! Test coverage might go up, too!

## Installation
Add this line to your application's Gemfile:

```ruby
gem "super_current"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install super_current
```

## Inspiration

Inspired by:
https://wiki.php.net/rfc/deprecate_dynamic_properties

## Contributing
Feel free to contribute. 

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
