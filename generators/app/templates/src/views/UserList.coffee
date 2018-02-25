import m from 'mithril'
import { User } from '../models'
import userImage from '../images/user.jpg'

# To customize the style of this component modify 'src/styles/userList.sass'

export class UserList
  oninit: User.loadList
  view:->
    m '.user-list',
      for user in User.list
        m 'a.user-list-item',
          href: "/edit/#{user.id}"
          oncreate: m.route.link
          m 'img.small-image',
            src: userImage
          "#{user.firstName} #{user.lastName}"
