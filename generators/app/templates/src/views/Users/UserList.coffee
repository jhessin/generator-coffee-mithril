import m from 'mithril'
import { User, route } from 'models'
import userImage from 'images/user.jpg'

# Loads and displays the User List.

export class UserList
  oninit:->
    User.loadList()
  view:->
    m '.ui.segment',
      m '.ui.relaxed.divided.list.huge',
        User.list.map (user) ->
          { id } = user
          m 'a.item.animate',
            onclick: -> route.set("/users/?id=#{id}")
            m 'img.ui.avatar.image',
              src: userImage
            m '.content',
              m '.header',
                user.firstName
              user.lastName
