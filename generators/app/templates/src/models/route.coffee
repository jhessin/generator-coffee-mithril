export route =
  current: '/'
  id: null
  get: ->
    @current
  set: (newPath)->
    params = /(\d+)/.exec(newPath)
    if params
      @id = params[1]
    else @id = null
    @current = newPath
  isActive: (path)->
    if typeof path is 'string'
      if path is @current
        '.active'
      else
        ''
    else if path.test(@current)
      '.active'
    else
      ''
