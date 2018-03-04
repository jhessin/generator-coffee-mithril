import m from 'mithril'

export wrap = (args...) ->
  switch args.length
    when 0
      throw new Error 'Wrap requires at least 1 argument'
    when 1
      args[0]
    else
      view: (vnode)->
        m args[0], vnode.attrs,
          m wrap(args[1..]...), vnode.attrs
