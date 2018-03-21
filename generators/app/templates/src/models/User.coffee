# This holds the user list and
# the currently selected user info.
# It also handles the network queries to update
# the userlist and related data.

export User =
  list: []
  loadList: ->
    m.request
      method: 'GET'
      url: 'https://rem-rest-api.herokuapp.com/api/users'
      withCredentials: true
    .then (result)->
      User.list = result.data
    .catch (error)->
      User.list[0] = error
  current: {}
  load: (id)->
    m.request
      method: 'GET'
      url: "https://rem-rest-api.herokuapp.com/api/users/#{id}"
      withCredentials: true
    .then (result)->
      User.current = result
  save: ->
    m.request
      method: 'PUT'
      url: "https://rem-rest-api.herokuapp.com/api/users/#{User.current.id}"
      data: User.current
      withCredentials: true
    .then ->
      User.loadList()
