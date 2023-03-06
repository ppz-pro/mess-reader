import React from 'react'

export default ({ className, children }) ->
  pug"""
    .mess-reader-layout
      div(className = className)= children
  """
