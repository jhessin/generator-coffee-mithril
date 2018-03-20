# I didn't like mithril's routing system so I made my own.
# It avoids changing the address bar which causes you to lose the site.

export route =
  # The current path
  current: '/'

  # This is specific to my example but you can do whatever you want
  params: {}

  # Save the path to a cookie (so reloading the page doesn't send you back.)
  save: ->
    document.cookie = "path=#{@current}"

  # Load at startup.
  load: ->
    path = document.cookie
    console.log "Loaded Cookies = #{path}"
    array = path.split(';')
    for item in array
      kv = item.split('=')
      if kv[0] is 'path'
        @set(kv[1..].join('=') or '/')

  # Get the current path (for a similar api to mithrils)
  get: ->
    @current

  # Set the current path (for a similar api to mithrils)
  set: (path)->
    console.log "setting path: #{path}"

    # Pull out any query string and save it as params
    params = /\?([\w=&]+)/.exec(path)?[1]
    if params? and typeof params is 'string'
      args = params.split('&')
      for value in args
        split = value.split('=')
        @params[split[0]] = split[1]
    else @params = {}

    # here is where we actually update the path.
    @current = path
    @save()

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
