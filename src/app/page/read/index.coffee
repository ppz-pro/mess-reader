import React from 'react'

import './index.styl'
import Layout from '../../cmp/layout/index.coffee'
import { map } from '../../../lib/mess-router/index.coffee'
import Menu from './menu/index.coffee'
import Reader from './reader/index.coffee'

map.push('/read', ->
  pug"""
    Layout.reader-page
      Menu
      Reader
  """
)