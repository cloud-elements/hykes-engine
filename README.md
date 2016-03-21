# hykes-engine <sub><sup>| Cloud Elements Enterprise builder</sup></sub>
[![version](http://img.shields.io/badge/version-0.0.0-blue.svg)](CHANGELOG.md)
[![spec](http://img.shields.io/badge/spec-%3E%3D%200.0.0-blue.svg)](https://github.com/cloud-elements/hykes-spec)
[![elements](http://img.shields.io/badge/elements-%3E%3D%202.55.0-blue.svg)](https://github.com/cloud-elements/soba)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](CONTRIBUTING.md)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](CONTRIBUTING.md)
[![license](http://img.shields.io/badge/license-apache-blue.svg)](LICENSE.md)
[![pm](http://img.shields.io/badge/pm-zenhub-blue.svg)](CONTRIBUTING.md)
[![circleci](https://circleci.com/gh/cloud-elements/hykes-engine.svg?style=shield)](https://circleci.com/gh/cloud-elements/hykes-engine)

## Installation

### Via Homebrew:

```bash
$ brew tap cloud-elements/hykes
$ brew install hykes-engine
```

### Via PPA:

In development

### Via compiling from source:

```bash
$ git clone git@github.com:cloud-elements/hykes-engine.git
$ cd hykes-engine
$ make
$ make install
```

> __PROTIP:__
You are responsible for ensuring all dependencies are installed, including transitive dependencies.
Examine [circle.yml](circle.yml) for a detailed example of the steps needed to compile from source
on Ubuntu.

## Usage

```bash
$ hykes-engine --help
Usage:
  hykes-engine build [--against=<role>] [--as=<username>] [--init] [--quiet]
  hykes-engine deploy [--as=<username>] [--quiet]
  hykes-engine key <username> <key> [--against=<role>] [--as=<username>] [--quiet]
  hykes-engine resume [--as=<username>] [--quiet]
  hykes-engine suspend [--as=<username>] [--quiet]

Core Commands:
  build      Build or rebuild cloud
  deploy     Deploy to cloud
  key        Key or rekey cloud
  resume     Resume cloud (publicly consumable)
  suspend    Suspend cloud (not publicly consumable)

More Information:
  docs     https://developers.cloud-elements.com
  forum    https://forum.cloud-elements.com
  repo     https://github.com/cloud-elements/hykes-engine
```

> __PROTIP:__ All commands prompt for required arguments which were not provided via options or
arguments. This allows for both traditional usage and prompt-based usage.

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

See [LICENSE.md](LICENSE.md)
