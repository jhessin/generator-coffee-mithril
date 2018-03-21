'use strict';
const Generator = require('yeoman-generator');
const chalk = require('chalk');
const yosay = require('yosay');

module.exports = class extends Generator {
  constructor(args, opts) {
    super(args, opts);

    this.argument('appname', { type: String, required: false });
  }
  prompting() {
    // Have Yeoman greet the user.
    this.log(
      yosay(`Welcome to the wicked ${chalk.red('generator-coffee-mithril')} generator!`)
    );

    if (this.options.appname) {
      this.props = this.options;
      return;
    }

    const prompts = [
      {
        type: 'input',
        name: 'appname',
        message: 'What name shall we give your project?',
        default: this.appname
      }
    ];

    return this.prompt(prompts).then(props => {
      // To access props later use this.props.someAnswer;
      this.props = props;
    });
  }

  writing() {
    this.log(`Creating ${chalk.green(this.props.appname)} please wait...`);
    // Make the directory
    this.spawnCommandSync('mkdir', [this.props.appname]);
    // Move to the directory
    this.destinationRoot(this.destinationPath(this.props.appname));

    // Copy template files
    this.fs.copyTpl(
      this.templatePath('_package.json'),
      this.destinationPath('package.json'),
      this.props
    );
    this.fs.copy(this.templatePath('src'), this.destinationPath('src'));

    // Remove test code
    this.spawnCommandSync('rm', ['-rf', 'src/manifest.cson']);

    // Copy template manifest
    this.fs.copyTpl(
      this.templatePath('_manifest.cson'),
      this.destinationPath('src/manifest.cson'),
      this.props
    );
    this.fs.copy(this.templatePath('.gitignore'), this.destinationPath('.gitignore'));
    this.fs.copy(
      this.templatePath('webpack.config.coffee'),
      this.destinationPath('webpack.config.coffee')
    );
    this.fs.copy(
      this.templatePath('coffeelint.json'),
      this.destinationPath('coffeelint.json')
    );
  }

  install() {
    this.log(chalk.blue('installing dependencies...'));

    this.yarnInstall().then(yarnError => {
      if (yarnError) {
        this.npmInstall().then(npmError => {
          if (npmError) this.log(chalk.red(npmError));
          else this.log(chalk.green('ALL DONE! Get Cracking!'));
        });
      } else this.log(chalk.green('ALL DONE! Get Cracking!'));
    });
  }
};
