import m from 'mithril'
import userImage from '../images/user.jpg'

# To customize the style of this component modify 'src/styles/layout.sass'

export class Layout
  view: (vnode)->
    m 'main.layout',
      m 'nav.menu',
        m 'a[href="/"]',
          oncreate: m.route.link
          'Users'
      m 'section',
        vnode.children
