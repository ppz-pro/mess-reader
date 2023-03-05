import React, { useEffect } from 'react'
import { notEmptyString } from '@ppzp/utils/type'

export config =
  404: -> <div>404</div>

getPath = -> location.hash.slice(1)

export class Router extends React.Component
  constructor: (props) ->
    super(props)
    @state =
      path: getPath()

  componentDidMount: ->
    window.addEventListener('hashchange', =>
      @setState({ path: getPath() })
    )

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

export nav2 = (path) ->
  location.hash = path