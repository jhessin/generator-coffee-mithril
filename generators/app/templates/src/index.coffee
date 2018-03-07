import m from 'mithril'
import { App } from './App'
import { route } from 'models'
import 'styles'

# Be sure to check out https://mithril.js.org/ for more
# information on the tools available for mithril including
# m.render() and m.route()

route.load()
m.mount document.body, App
