import m from 'mithril'

# This is a simple wraper function that wraps components up in a chain.
# This is ideal for when using vanilla mithril routing i.e.
# m.route document.body, '/',
#   '/': wrap LayoutWithMainTabs, HomePage
#   '/subTabs': wrap LayoutWithMainTabs, SubLayoutWithSubTabs
#   '/subTabs/subsubTabs': wrap LayoutWithMainTabs, SubLayoutWithSubTabs,
#     ActualContentHere
export wrap = (args...) ->
  switch args.length
    when 0
      # Never be afraid to throw an error
      # if the program is doing something wrong.
      throw new Error 'Wrap requires at least 1 argument'
    when 1
      args[0]
    else
      view: (vnode)->
        m args[0], vnode.attrs,
          m wrap(args[1..]...), vnode.attrs # I love recursion 😈
