# The `Gemfile`

## First off, what is a Gem?

A `gem` is a self-contained package of ruby code that someone wrote and has made freely available to make your (and their) life easier! Like [`rspec`](https://github.com/rspec/rspec) or [`byebug`](https://github.com/deivid-rodriguez/byebug)! Read more about gems [here](./gems-and-rbenv.md). Interested in [creating your own gem](http://ryanlue.com/posts/2017-02-18-how-to-publish-a-gem)?

## The Bundler gem

The [`bundler`](http://bundler.io/) gem gives us a great way to manage and use different versions of gems. When you run `bundle install`, it references the `Gemfile` in the current directory to download any specified versions of a gem that your computer hasn’t downloaded yet. If no particular version of a gem is specified, the bundler will use the most recently released stable version of the gem.

Bundler will, by default, search and download missing gems and versions you specify in your Gemfile from [RubyGems](https://rubygems.org/). You can specify a different `source` other than RubyGems if needed. Check out how to change the [`source`](http://bundler.io/v1.15/man/gemfile.5.html#GLOBAL-SOURCES).

## Why do we need Bundler?

New versions of a gem can be released, which might include bug fixes, new features, or complete reworks of the code/API. These new versions might not be compatible with programs that were written expecting to use the old version! For that reason, including a Gemfile in our program allows us to choose which versions of each gem we expect to be used with our program.

## How to create and use a Gemfile

If you don’t have bundler yet, you can install it with:

```bash
gem install bundler
```

The Gemfile should live in a ruby program's root directory. Here are two commands to initialize a Gemfile:

```bash
bundle init
```
or
```bash
touch Gemfile
```

Open the Gemfile and specify the versions (or range of versions) of any gems that you require in your program:

```ruby
gem "nokogiri", "1.4.2" # Use version 1.4.2
gem "nokogiri", ">= 1.4.2" # Any version greater or equal to 1.4.2
gem "nokogiri", "< 1.8.0", ">= 1.4.2" # Any version less than 1.8.0 and greater or equal to 1.4.2

# The “Pessimistically Greater Than or Equal To” operator
gem "nokogiri", "~> 1.0" # Any future version that is 1.x, same as: gem “nokogiri”, ">= 1.0", "< 2.0"
gem "nokogiri", "~> 1.1" # Any future version that is 1.1.x, same as: gem “nokogiri”, ">= 1.1", "< 1.2"
gem "nokogiri", "~> 1.4.3" # Any future version that is 1.4.3.x, same as: gem “nokogiri”, ">= 1.4.3", "< 1.4.4"
```

To specify a particular version of ruby:
```ruby
ruby "1.9.3"
```

There are more [Gemfile options](http://bundler.io/v1.15/man/gemfile.5.html)!

Once you are done, run:
```bash
bundle install
```

_(Note: This requires internet access!)_

**You should never have to use [`sudo bundle install`](http://bundler.io/v1.3/man/bundle-install.1.html#SUDO-USAGE).**

By default, the above installs gems to the same location as `gem install`.

When modifying a Gemfile after using `bundle install`, bundler only updates gem versions that have been modified by the user. It will NOT auto-update gems to the most recent version. Read more about [conservative-updating](http://bundler.io/v1.3/man/bundle-install.1.html#CONSERVATIVE-UPDATING).

## The `Gemfile.lock` file

Bundling a Gemfile the first time will create a Gemfile.lock in the same directory. This file is a snapshot of your Gemfile the last time you bundled. This file is updated whenever you run `bundle install`.

## `bundle exec`

`bundle exec` executes the command that follows in the context of `Gemfile.lock`. It does this by temporarily modifying the shell environment. More info on [`bundle exec`](http://bundler.io/v1.15/bundle_exec.html)!

```
bundle exec rspec spec/my_spec.rb
bundle exec rails g migration AddIndexToUserIdOnTasks
```

If you do not use `bundle exec` before running a command like `rspec spec/my_spec.rb`, your shell will use the current global version of that gem. You can find out the global version of a gem with the `-v` flag.

```
rails -v
```

## Preparing for Deployment

To ready your app for deployment, use the `--deployment` flag.

```
bundle install --deployment
```

Using flag requires and does a number of things, which includes creating a copy of each gem used in a `vendor/bundle` directory. Read more about [deployment](http://bundler.io/v1.3/man/bundle-install.1.html#DEPLOYMENT-MODE).

## Common Issues

Sometimes the `Gemfile.lock` does not update properly. If you are getting any weird bundler errors, remove this file and try running `bundle install` again.
