import m from 'mithril'
import userImage from 'images/user.jpg'
import { User } from 'models'

cntrl =
  active: m.route.get()
  setActive: (value)->
    m.route.set(value, null, replace: true)
    @active = value
  isActive: (value)->
    if @active is value
      '.active'
    else
      ''
export class Layout
  view: (vnode)->
    m '.app.ui.container',
      m '.ui.huge.top.attached.tabular.menu',
        m "div.item#{cntrl.isActive('/')}",
          onclick: -> cntrl.setActive('/')
          'Home'
        m "div.item#{cntrl.isActive(/users/)}",
          onclick: -> cntrl.setActive('/users')
          'Users'
      m '.ui.bottom.attached',
        vnode.children
