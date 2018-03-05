import m from 'mithril'
import userImage from 'images/user.jpg'
import { User } from 'models'

export class Breadcrumb
  view: (vnode)->
    m '.app.ui.container',
      m '.ui.huge.breadcrumb',
        if m.route.get() is '/users'
          m '.section.active', 'Users'
        else [
          m 'a.section',
            onclick: -> m.route.set('/users', null, replace: true)
            'Users'
          m 'i.right.angle.icon.divider'
          m '.active.section', "#{User.current.firstName}
            #{User.current.lastName}" ]
      m '.ui.huge.container',
        vnode.children
