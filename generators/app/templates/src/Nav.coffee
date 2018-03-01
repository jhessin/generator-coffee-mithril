import m from 'mithril'
import { Layout, UserList, UserForm } from 'views'
import './styles'

render = (component)->
  render: (vnode)->
    m Layout, m(component, vnode.attrs)

export Nav =
  '/': render UserList
  '/edit/:id': render UserForm
