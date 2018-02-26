import m from 'mithril'
import { User } from '../models'
# import 'semantic-ui-css/semantic.min.css'
import userImage from '../images/user.jpg'

# To customize the style of this component modify 'src/styles/userList.sass'

export class UserList
  oninit:->
    User.loadList()
  view:->
    m '.ui.segment',
      m '.ui.relaxed.divided.list.huge',
        for user in User.list
          m 'a.item.animate',
            href: "/edit/#{user.id}"
            oncreate: m.route.link
            m 'img.ui.avatar.image',
              src: userImage
            m '.content',
              m '.header',
                user.firstName
              user.lastName
