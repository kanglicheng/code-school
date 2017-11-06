# Setting up a Development Environment

Being a developer isn't just hacking away into the wee hours of the morning or debugging a new feature. In order to become a well-rounded developer we should also understand what tools we need and a minimum understanding of how they work. This includes setting up our computers for development.

Here at App Academy we work with a Ruby on Rails, JavaScript, React, Redux, and PostgresSQL stack. A [stack][stack-defn] is simply a collection of software and hardware used in development of an application. For our specific purposes we are using Ruby on Rails on the backend/server, PostgresSQL to house our database, and JavaScript + React + Redux for frontend rendering and logic.

[stack-defn]: https://en.wikipedia.org/wiki/Solution_stack

As we progress through the course you will be prompted to complete a few installation and configuration steps to get your personal machine ready for the next phase.

## Phase 0: Preparing your machine

Here we will install basic developer tools, such as [homebrew][homebrew] (a 3rd party package manager for MacOS), Xcode (a library of developer tools provided by Apple), git (a version control system we will be using throughout the course), and Atom (a full-featured text-editor).

### Chrome
Here at App Academy, our browser of choice is Google Chrome. This isn't super important at the beginning of the course, but once we get into frontend development the Chrome Devtools (think frontend debugging) are going to play a very important role.

To install, download from the [Google Chrome][chrome-dl] and install.

#### [Optional] App Academy Chrome Tab
We have a custom Chrome Extension for new tabs that provides a dashboard with links to the curriculum, relevant documentation, and, once your cohort starts, links to the day's projects, readings, and homework.

This is not required, but feel free to give it a try. To install, follow the installation instructions on the [App Academy Chrome Tab Repo][aa-chrome-tab].

### Xcode
Let's start with Xcode. First download and install Xcode from the App Store.

Next, install the command line tools, by running the following from the console.
```sh
$ xcode-select --install
```

### Homebrew
Homebrew is kind of like a low-tech App Store. It allows us access to and the ability to install a wide variety of software and command line tools from the console. These are distinct from those hosted on the App Store and will need to be managed by Homebrew.

Enter the following in your terminal to download and install Homebrew:

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Let's break this down a bit. `curl`, a command-line tool commonly used for downloading files from the internet, is used to download the Homebrew installation file. The `"$(...)"` transforms the file content into a string. Finally, the string is passed to our Ruby executable (`/usr/bin/ruby` is where this file is stored on our machine) with the `-e` flag to tell Ruby to run the argument as code.

Check out the [Homebrew website][homebrew] to learn the basic commands.

[homebrew]: https://brew.sh/
[chrome-dl]: https://www.google.com/chrome/browser/desktop/index.html
[aa-chrome-tab]: https://github.com/appacademy/app-academy-chrome-tab

### Git
Git is a version control system that allows us to track, commit and revert changes to files within a directory. Here we will install it and add global user info.

```sh
# install git
brew install git

# makes git terminal output pretty
git config --global color.ui true

# this will mark you as the 'author' of each committed change
git config --global user.name "your name here"

# use the email associated with your GitHub account
git config --global user.email your_email_here
```

### Atom
This one is super easy. Go to [atom.io](atom.io), then download and install Atom.

Next, use the Atom Package Manager (apm) to install a few packages that will provide linting and syntax highlighting:
```sh
# apm is the 'atom package manager'
apm install linter linter-eslint linter-rubocop react rspec
```

## Phase 1: Ruby

Here we will be setting up Ruby with the help of [rbenv][rbenv], a Ruby environment manager. We like rbenv because it allows us to switch between versions of Ruby easily and setup default versions to use within project directories.

### Rbenv + Ruby
First we will install rbenv, then use it to install our desired version of Ruby.

```sh
# install rbenv
brew install rbenv

# add to the PATH (rbenv commands are now available from terminal)
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

# initialize rbenv everytime you open a new console window (otherwise our system ruby version will take over when we start a new terminal session)
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# update current console window with new settings
source ~/.bashrc

# install Ruby version 2.3.1
rbenv install 2.3.1

# set version 2.3.1 to be our global default
rbenv global 2.3.1

# the 'rehash' command updates the environment to your configuration
rbenv rehash

# and let's verify everything is correct
# check the version
ruby -v # => 2.3.1

# check that we are using rbenv (this tells you where the version of ruby you are using is installed)
which ruby # => /Users/your-username/.rbenv/shims/ruby
```

### Gems

There are a few gems we will want to access globally.

- Bundler allows us to define project dependencies inside a `Gemfile` and gives us a bunch of commands to update, remove and install them. Check out the [Bundler docs][bundler-docs] for more info.
- Pry is an alternative to the Irb (the default Ruby REPL). It is not only more powerful, but also easier to use than Irb and should be your go-to for running and debugging Ruby code. Check out the [Pry website][pry-repl] for more info and a super useful tutorial.
- Byebug is feature-rich debugging tool for Ruby. With Byebug you can halt the execution of your code and inspect/track variables and the flow of execution. Lots of cool features in here, so check out the [Byebug docs][byebug-docs]!

Let's install them.

```sh
gem install bundler pry byebug
```

[rbenv]: https://github.com/rbenv/rbenv
[bundler-docs]: http://bundler.io/docs.html
[pry-repl]: http://pryrepl.org/
[byebug-docs]: https://github.com/deivid-rodriguez/byebug

## Phase 2: SQL and Rails



### PostgreSQL


### SQLite

### Rails

## Phase 3: Frontend Development
