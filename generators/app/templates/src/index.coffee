import m from 'mithril'
import { App } from './App'
import 'styles'

# Be sure to check out https://mithril.js.org/ for more
# information on the tools available for mithril including
# m.render() and m.route()

# m.route.prefix '' # Hide the silly hashbang'#!'
# m.route document.body, '/',
#   '/': wrap Layout, Home
#   '/users': wrap Layout, Breadcrumb, UserList
#   '/edit/:id': wrap Layout, Breadcrumb, UserForm
# m.render document.body, 'Hello World'
m.mount document.body, App
