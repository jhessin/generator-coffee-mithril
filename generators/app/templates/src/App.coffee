import m from 'mithril'
import { route } from 'models'
import { Home, Breadcrumb, UserList, UserForm } from 'views'

# The main navigation header.

export class App
  view: ->
    m '.app.ui.container',
      m '.ui.huge.top.attached.tabular.menu',
        m "div.item#{route.isActive('/')}",
          onclick: -> route.set('/')
          'Home'
        m "div.item#{route.isActive(/users/)}",
          onclick: -> route.set('/users')
          'Users'
      m ".ui.bottom.attached.tab.segment#{route.isActive('/')}",
        m Home
      m ".ui.bottom.attached.tab.segment#{route.isActive(/users/)}",
        m Breadcrumb,
          if route.params.id
            m UserForm,
              id: route.params.id
          else
            m UserList
