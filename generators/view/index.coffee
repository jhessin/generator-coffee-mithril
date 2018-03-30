Generator = require 'yeoman-generator'
chalk = require 'chalk'
yosay = require 'yosay'
rimraf = require 'rimraf'

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
      @props = @options
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
      @props = props

  writing: ->
    @log "Creating #{chalk.green @props.name} view please wait..."

    # Copy template files
    @fs.copyTpl @templatePath('_view.coffee_'),
      @destinationPath "#{@props.name}.coffee"
      @props

    if @fs.exists 'index.coffee'
      @log chalk.green('Adding to index.coffee file. Please confirm...')
      @fs.append @destinationPath('index.coffee'),
        "export * from './#{@props.name}'\n"
    else
      @fs.copyTpl @templatePath('index.coffee'),
        @destinationPath 'index.coffee'
        @props
