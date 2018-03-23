import { User, route } from 'models'

# This is the User Form where you can actually change the name of a user.
# This is really dummy data and it will be lost when restarting your browser.

export class UserForm
  oninit: (vnode) -> User.load vnode.attrs.id
  view: ->
    m 'form.ui.huge.form.inverted',
      onsubmit: (e) ->
        e.preventDefault()
        User.save()
        route.set('/users')
      m '.field',
        m 'label', 'First Name'
        m 'input\
          [type=text]\
          [placeholder=First name]',
          oninput: m.withAttr 'value', (value) ->
            User.current.firstName = value
          value: User.current.firstName
      m '.field',
        m 'label', 'Last name'
        m 'input\
          [placeholder=Last name]',
          oninput: m.withAttr 'value', (value) ->
            User.current.lastName = value
          value: User.current.lastName
      m 'button.ui.huge.button.animate\
        [type=submit]', 'Save'
