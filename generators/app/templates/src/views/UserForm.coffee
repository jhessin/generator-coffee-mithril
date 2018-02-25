import m from 'mithril'
import { User } from '../models'

# To customize the style of this component modify 'src/styles/userForm.sass'

export class UserForm
  oninit: (vnode)-> User.load vnode.attrs.id
  view: ->
    m 'form.user-form',
      onsubmit: (e)->
        e.preventDefault()
        User.save()
        m.route.set('/')
      m 'label.label',
        'First Name'
      m 'input.input\
        [type=text]\
        [placeholder=First name]',
        oninput: m.withAttr 'value', (value)->
          User.current.firstName = value
        value: User.current.firstName
      m 'label.label', 'Last name'
      m 'input.input\
        [placeholder=Last name]',
        oninput: m.withAttr 'value', (value)->
          User.current.lastName = value
        value: User.current.lastName
      m 'button.button\
        [type=submit]', 'Save'
