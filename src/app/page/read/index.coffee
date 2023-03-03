import React, { useRef, useEffect } from 'react'
import Epub from 'epubjs'

import demoBook from './demo.epub'

export default ->
  reader = useRef()
  useEffect(->
    book = Epub(demoBook)
    render = book.renderTo(reader.current, {
      flow: 'paginated'
    })
    render.display()
    return
  , [])
  pug"""
    #mess-reader(ref = reader)
  """