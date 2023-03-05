import React, { useEffect } from 'react'
import { notEmptyString } from '@ppzp/utils/type'

import { pushState } from '../history/index.coffee'

export config =
  404: -> <div>404</div>

getPath = -> location.pathname

export class Router extends React.Component
  constructor: ->
    super()
    @state =
      path: getPath()

  componentDidMount: ->
    pushState.listen (state, unused, path) =>
      @setState({ path })

  render: ->
    path = @state.path || '/'
    Component = map.get(path) || config[404]
    return <Component />

export map = do ->
  m = {}
  return
    push: (path, Component) ->
      unless(notEmptyString path)
        throw Error('路径不能为空')
      if(m[path])
        throw Error('路径重名 ' + path)
      m[path] = Component
    get: (path) -> m[path]

