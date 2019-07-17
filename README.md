# generator-coffee-mithril [![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-image]][daviddm-url] [![Coverage percentage][coveralls-image]][coveralls-url]

> Generate a mithril project using CoffeeScript, ES6, and Stylus.

# NOTICE: ARCHIVED
> I am no longer developing this project. I have caved in to peer pressure and moved to typescript (even though it isn't nearly as pretty). Please consider forking (or using an existing fork) if you want to use this project.

## Installation

### Option 1: Global node install

Just install [Yeoman](http://yeoman.io) and generator-coffee-mithril using [yarn](https://yarnpkg.com) or [npm](https://www.npmjs.com/). I recommend yarn. (I assume you have pre-installed [node.js](https://nodejs.org/)).

```bash
yarn global add yo generator-coffee-mithril
```

### Option 2: Latest github repo

If you want to build the latest and greatest version of the generator you can follow these steps.

> WARNING: I sometimes will commit broken code temporarily when switching between home and work computers. I will usually put a 'BROKEN' commit message to show this and you can always roll back a commit to get a working version.

You still need yeoman for this:

```bash
yarn global add yo
```

But instead of installing the generator through npm/yarn you simply clone this repo anywhere on your hard drive:

```bash
git clone git@github.com:jhessin/generator-coffee-mithril.git
```

or if you don't use ssh:

```bash
git clone https://github.com/jhessin/generator-coffee-mithril.git
```

Then:

```bash
cd generator-coffee-mithril
yarn link
```

This makes the generator available to yeoman. When a new update comes out you can simply go back to this directory and run:

```bash
git pull
```

## Usage

To generate a coffee-mithril project:

```bash
yo coffee-mithril [project-name]
```

## Update Roadmap

Prior to v2.0 I plan to integrate some postCSS plugins and polish up the sample. My goal for this project is for you to be able to accomplish anything without touching either HTML, CSS, or JavaScript but using purely CoffeeScript, Stylus, and CSON.

v2.0 will include several sub-generators for views/models/styles that may or may not intermingle with eachother. I haven't decided if I'm going to have stylesheets generated when creating a view, or if I will have a separate stylesheet generator or both. Nevertheless I want to tweak the example app and build a good foundation before going any further.

## Getting To Know Yeoman

* Yeoman has a heart of gold.
* Yeoman is a person with feelings and opinions, but is very easy to work with.
* Yeoman can be too opinionated at times but is easily convinced not to be.
* Feel free to [learn more about Yeoman](http://yeoman.io/).

## License

GPL-3.0 © [Jim Hessin](http://www.grillbrickstudios.com)

[npm-image]: https://badge.fury.io/js/generator-coffee-mithril.svg
[npm-url]: https://npmjs.org/package/generator-coffee-mithril
[travis-image]: https://travis-ci.org/jhessin/generator-coffee-mithril.svg?branch=master
[travis-url]: https://travis-ci.org/jhessin/generator-coffee-mithril
[daviddm-image]: https://david-dm.org/jhessin/generator-coffee-mithril.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/jhessin/generator-coffee-mithril
[coveralls-image]: https://coveralls.io/repos/jhessin/generator-coffee-mithril/badge.svg
[coveralls-url]: https://coveralls.io/r/jhessin/generator-coffee-mithril
