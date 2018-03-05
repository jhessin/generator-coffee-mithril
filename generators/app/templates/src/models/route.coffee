# I didn't like mithril's routing system so I made my own.
# It avoids changing the address bar which causes you to lose the site.

export route =
  # The current path
  current: '/'

  # This is specific to my example but you can do whatever you want
  id: null

  # Get the current path (for a similar api to mithrils)
  get: ->
    @current

  # Set the current path (for a similar api to mithrils)
  set: (newPath)->
    # Here we pull out the first number in the path and save it as the id
    params = /(\d+)/.exec(newPath)
    if params
      @id = params[1]
    else @id = null

    # here is where we actually update the path.
    @current = newPath

  # This is a quick utility function to add a class when the path matches
  isActive: (path)->
    # use a string for an exact match
    if typeof path is 'string'
      if path is @current
        '.active'
      else
        ''
    # otherwise a regular expression for partial matches
    else if path.test(@current)
      '.active'
    else
      ''
