import m from 'mithril'
import { wrap } from 'utils'
import { Layout, UserList, UserForm } from 'views'
import 'styles'

m.route.prefix '' # Hide the silly hashbang'#!'
m.route document.body, '/',
  '/': wrap Layout, UserList
  '/edit/:id': wrap Layout, UserForm
