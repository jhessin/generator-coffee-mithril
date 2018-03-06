# I didn't like mithril's routing system so I made my own.
# It avoids changing the address bar which causes you to lose the site.

export route =
  # The current path
  current: '/'

  # This is specific to my example but you can do whatever you want
  params: {}

  # Get the current path (for a similar api to mithrils)
  get: ->
    @current

  # Set the current path (for a similar api to mithrils)
  set: (path)->

    # Pull out any query string and save it as params
    params = /\?([\w=&]+)/.exec(path)?[1]
    console.log params
    if params? and typeof params is 'string'
      args = params.split('&')
      for value in args
        split = value.split('=')
        @params[split[0]] = split[1]
    else @params = {}
    @current = path

    # here is where we actually update the path.
    @current = path

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
