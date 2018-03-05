import m from 'mithril'
import { User } from 'models'
import userImage from 'images/user.jpg'

# To customize the style of this component modify 'src/styles/userList.sass'

export class UserList
  oninit:->
    User.loadList()
  view:->
    m '.ui.segment',
      m '.ui.relaxed.divided.list.huge',
        for user in User.list
          m 'a.item.animate',
            onclick: -> m.route.set("/edit/#{user.id}", null, replace: true)
            m 'img.ui.avatar.image',
              src: userImage
            m '.content',
              m '.header',
                user.firstName
              user.lastName
