import React from 'react'

export default ({ className, children }) ->
  pug"""
    .mess-reader-page(className = className)
      = children
  """
