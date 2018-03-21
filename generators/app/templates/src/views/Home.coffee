import logo from 'images/logo.svg'

# This is the Home page taken directly from create-react-app

export class Home
  view: ->
    m 'div.App',
      m 'header.App-header',
        m 'img.App-logo',
          src: logo
          alt: 'logo'
        m 'h1.App-title',
          'Welcome to Mithril'
      m 'p.App-intro',
        'To get started, edit '
        m 'code',
          'src/App.coffee'
        ' and save to reload.'
        m 'br'
        'Be sure to check out the homepages for '
        m 'a[href=http://coffeescript.org/]', 'CoffeeScript'
        ' and '
        m 'a[href=https://mithril.js.org/]', 'Mithril.'
        m 'br'
        'They have a ton of tools, tutorials, and information.'
        m 'br'
        'Most of the styling and layout of this demo page was done with '
        m 'a[href=https://semantic-ui.com/]', 'semantic-ui'
        '.'
        m 'br'
        'Check out '
        m 'code',
          'src/manifest.cson'
        ' for info on adding CDN\'s updating the title or customizing
        postCSS plugins.'
