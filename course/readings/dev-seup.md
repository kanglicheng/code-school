# Setting up a Development Environment

Being a developer isn't just hacking away into the wee hours of the morning or debugging a new feature. In order to become a well-rounded developer we should also understand what tools we need and a minimum understanding of how they work. This includes setting up our computers for development.

Here at App Academy we work with a Ruby on Rails, JavaScript, React, Redux, and PostgresSQL stack. A [stack][stack-defn] is simply a collection of software and hardware used in development of an application. For our specific purposes we are using Ruby on Rails on the backend/server, PostgresSQL to house our databse, and JavaScript + React + Redux for frontend rendering and logic.

[stack-defn]: https://en.wikipedia.org/wiki/Solution_stack

As we progress through the course you will be prompted to complete a few installation and configuration steps to get your personal machine ready for the next phase.

## Phase 0: Preparing your machine

Here we will install basic developer tools, such as [homebrew][homebrew] (a 3rd party package manager for MacOS), Xcode (a library of developer tools provided by Apple), and Atom (a full-featured text-editor).

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
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Check out the [Homebrew website][homebrew] to learn the basic commands.

[homebrew]: https://brew.sh/

### Atom
This one is super easy. Go to [atom.io](atom.io), then download and install Atom.

Next install a few packages that will provide linting and syntax highlighting:
```sh
# apm is the 'atom package manager'
apm install linter linter-eslint linter-rubocop react rspec
```

## Phase 1: Ruby

Here we will be setting up Ruby with the help of [rbenv][rbenv], a Ruby environment manager. We like rbenv because it allows us to switch between versions of Ruby easily and setup default versions to use within project directories.



[rbenv]: https://github.com/rbenv/rbenv

## Phase 2: SQL and Rails

## Phase 3: Frontend Development
