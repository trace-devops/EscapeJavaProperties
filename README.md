# ProperProperties

[![Build Status](http://img.shields.io/travis/jnbt/java-properties.png)](https://travis-ci.org/jnbt/jnbt/java-properties)
[![Code Climate](http://img.shields.io/codeclimate/github/jnbt/java-properties.png)](https://codeclimate.com/github/jnbt/java-properties)
[![Coveralls](http://img.shields.io/coveralls/jnbt/java-properties.png)](https://coveralls.io/r/jnbt/java-properties)
[![RubyGems](http://img.shields.io/gem/v/java-properties.png)](http://rubygems.org/gems/java-properties)
[![Gemnasium](http://img.shields.io/gemnasium/jnbt/java-properties.png)](https://gemnasium.com/jnbt/java-properties)
[![Inline docs](http://inch-pages.github.io/github/jnbt/java-properties.png)](http://inch-pages.github.io/github/jnbt/java-properties)

A ruby library to read and write [Java properties files](http://en.wikipedia.org/wiki/.properties), which format is better describe [in the Java documentation](http://docs.oracle.com/javase/6/docs/api/java/util/Properties.html#load(java.io.Reader\)).

## Installation

Install via Rubygems or Gemfile

```zsh
$ gem install proper_properties
```

## Loading files

You can load a valid Java properties file from the file system using a path:

```ruby
properties = ProperProperties.load("path/to/my.properties")
properties[:foo] # => "bar"
```

If have already the content of the properties file at hand than parse the content as:

```ruby
properties = ProperProperties.load("foo=bar")
properties[:foo] # => "bar"
```

## Writing files

You can write any Hash-like structure as a properties file:

```ruby
hash = {:foo => "bar"}
ProperProperties.write(hash, "path/to/my.properties")
```

Or if you want to omit the file you can receive the content directly:

```ruby
hash = {:foo => "bar"}
ProperProperties.generate(hash)  # => "foo=bar"
```

## Encodings and special chars

Although ISO 8859-1 is assumed for Java properties files, they normally use UTF-8 encoding. This tool tries to convert them:

```
"ה" <=> "\u05d4"
```

The tool also escaped every '=', ' ' and ':' in the name part of a property line:

```ruby
ProperProperties.generate({"i : like=strange" => "bar"}) 
# => "i\ \:\ like\=strange=bar"
```

## Multi line and line breaks

In Java properties files there is distinction between natural lines and logical lines (than may span several lines by escaping the line terminator characters). 

Assume the following input:

```ini
my=This is a multi \
   line content with only \n one line break
```

The parses would read:

```ruby
{:my => "This is a multi line content which only \n one line break"}
```

In the opposite direction line breaks will be correctly escaped but the generator will never use multi line values.

## Contributing

1. [Fork it!](https://github.com/tnarik/proper_properties/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

- Tnarik Innael (@tnarik)
- Jonas Thiel (@jonasthiel) : [original project](https://github.com/jnbt/java-properties) from commit [1f2c4b008d69d0eae1084b1adfdea814e2b29899]

## References

For a proper description about the properties file format have a look at the [Java Plattform documentation](http://docs.oracle.com/javase/6/docs/api/java/util/Properties.html#load(java.io.Reader\)).

## License

This gem is released under the MIT License. See the LICENSE.txt file for further details.
