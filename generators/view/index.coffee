Generator = require 'yeoman-generator'
chalk = require 'chalk'
yosay = require 'yosay'
rimraf = require 'rimraf'
path = require 'path'
fs = require 'fs'

split = (name)->
  console.log "The Path Separator is #{path.sep}"
  po = path.parse(name)
  {
    paths: po.dir.split(path.sep)
    name: po.name
  }

module.exports = class extends Generator
  constructor: (args, opts)->
    super(args, opts)

    @argument 'name',
      type: String
      required: false

  prompting:->
    @log yosay("Welcome to the wicked #{chalk.red 'coffee-mithril'}
                View generator!")

    if @options.name
      @props = split @options.name
      return
    prompts = [
      {
        type: 'input'
        name: 'name'
        message: 'Please name your view: '
        default: @name
      }
    ]

    @prompt prompts
    .then (props)=>
      @props = split props.name

  writing: ->
    @log "@props = #{JSON.stringify @props}"
    @log "Creating #{chalk.green @props['name']} view please wait..."

    # A quick utility to make an index
    makeIndex = (name)=>
      if @fs.exists 'index.coffee'
        @log chalk.green('Adding to index.coffee file. Please confirm...')
        @fs.append @destinationPath('index.coffee'),
          "export * from './#{name}'\n"
      else
        @fs.copyTpl @templatePath('index.coffee'),
          @destinationPath 'index.coffee'
          {name}
    # check if the path is absolute
    if @props.root isnt ''
      @destinationRoot @props.root

    # Build directory structure
    for dir in @props.paths
      try
        stat = fs.statSync dir
        if stat?.isDirectory()
          makeIndex(dir)
          @destinationRoot @destinationPath(dir)
        else
          throw new Error "There is already a file called #{dir}
                          SMACK DAB in your path. Try a different location."
      catch
        makeIndex(dir)
        @spawnCommandSync 'mkdir', [dir]
        @destinationRoot @destinationPath(dir)

    # Copy template files
    @fs.copyTpl @templatePath('_view.coffee_'),
      @destinationPath "#{@props.name}.coffee"
      @props

    makeIndex(@props.name)
