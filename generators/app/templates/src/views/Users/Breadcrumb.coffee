import m from 'mithril'
import userImage from 'images/user.jpg'
import { User, route } from 'models'

export class Breadcrumb
  view: (vnode)->
    m '.app.ui.container',
      m '.ui.huge.breadcrumb',
        if route.get() is '/users'
          m '.section.active', 'Users'
        else [
          m 'a.section',
            onclick: -> route.set('/users')
            'Users'
          m 'i.right.angle.icon.divider'
          m '.active.section', "#{User.current.firstName}
            #{User.current.lastName}" ]
      m '.ui.container',
        vnode.children
