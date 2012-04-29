# Threaded::Resque

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'threaded-resque'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install threaded-resque

## Usage

To start multiple workers in one process, set the ```WORKERS``` environment variable and run ```rake threaded_resque:workers```.

```
$ WORKERS=critical:20,high:10 rake threaded_resque:workers
```

```WORKERS``` is a comma delimited list of elements, where each element has the following syntax: "[name of queue]:[number of threads consuming that queue]".

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
