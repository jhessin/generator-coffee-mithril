import m from 'mithril'
import userImage from 'images/user.jpg'
import { User } from 'models'

# To customize the style of this component modify 'src/styles/layout.sass'

export class Layout
  view: (vnode)->
    m '.ui.container',
      m '.ui.huge.breadcrumb',
        if m.route.get() is '/'
          m '.section.active', 'Users'
        else [
          m 'a.section[href="/"]',
            oncreate: m.route.link
            'Users'
          m 'i.right.angle.icon.divider'
          m '.active.section', "#{User.current.firstName}
            #{User.current.lastName}" ]
      m '.ui.huge.container',
        vnode.children
