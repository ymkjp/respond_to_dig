RespondToDig
===

[![Build Status](https://travis-ci.org/announce/respond_to_dig.svg?branch=master)](https://travis-ci.org/announce/respond_to_dig)

This gem backports Array#dig and Hash#dig methods from Ruby 2.3+ to earlier versions of Ruby, only if you explicitly call it.

## vs [RubyDig](https://github.com/Invoca/ruby_dig)
* RubyDig has side-effects, but RespondToDig doesn't.
* RespondToDig only supports `Array` and `Hash`, but RespondToDig supports any `Enumerable` classes which have `[]` method such as `Struct`.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'respond_to_dig'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install respond_to_dig

## Usage

```
require 'respond_to_dig'

response = RespondToDig::respond_to_dig({
            mom: {first: "Marge", last: "Bouvier"},
            dad: {first: "Homer", last: "Simpson"},
            kids: [
                {first: "Bart", last: "Simpson"},
                {first: "Lisa", last: "Simpson"}
            ]})

response.dig(:kids, 1, :first)
# => "Lisa"
```
