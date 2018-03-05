import m from 'mithril'
import logo from 'images/logo.svg'

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
