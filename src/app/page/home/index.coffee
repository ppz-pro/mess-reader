import React from 'react'

import Layout from '../../cmp/layout/index.coffee'
import { map } from '../../../lib/mess-router/index.coffee'
import { pushState } from '../../../lib/history/index.coffee'

map.push('/', ->
  nav2Reader = -> pushState({}, '', '/read')
  pug"""
    Layout.home
      main(onClick = nav2Reader) home
  """
)