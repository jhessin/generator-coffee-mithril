Generator = require 'yeoman-generator'
chalk = require 'chalk'
yosay = require 'yosay'
rimraf = require 'rimraf'

module.exports = class extends Generator
  constructor: (args, opts)->
    super args, opts

    @argument 'appname',
      type: String
      required: false

  prompting: ->
    # Have Yeoman greet the user.
    @log "Welcome to the wicked #{chalk.red 'coffee-mithril'} generator!"

    if @options.appname
      @props = @options
      return

    prompts = [
      {
        type: 'input'
        name: 'appname'
        message: 'What name shall we give your project?'
        default: @appname
      }
    ]

    @prompt prompts
    .then (props)=>
      @props = props

  writing: ->
    @log "Creating #{chalk.green @props.appname} please wait..."
    # Make the directory
    @spawnCommandSync 'mkdir', [ @props.appname ]
    # Move to the directory
    @destinationRoot @destinationPath(@props.appname)

    # Copy template files
    @fs.copyTpl @templatePath('_package.json'),
      @destinationPath('package.json')
      @props
    @fs.copy @templatePath('src'),
      @destinationPath('src')

    # Remove test code
    rimraf @destinationPath('src/manifest.cson'), =>
      @fs.copyTpl @templatePath('_manifest.cson'),
        @destinationPath('src/manifest.cson')
        @props

    @fs.copy @templatePath('.gitignore'),
      @destinationPath('.gitignore')
    @fs.copy @templatePath('webpack.config.coffee'),
      @destinationPath('webpack.config.coffee')
    @fs.copy @templatePath('coffeelint.json'),
      @destinationPath('coffeelint.json')
    @fs.copy @templatePath('postcss.config.js'),
      @destinationPath('postcss.config.js')

  install: ->
    @log chalk.blue('installing dependencies...')

    finished = =>
      @log chalk.green('ALL DONE! Get Cracking!')

    @yarnInstall().then (yarnError)=>
      if yarnError
        @npmInstall().then (npmError)=>
          if (npmError) then @log(chalk.red(npmError))
          else finished()
      else finished()
    return
