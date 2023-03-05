import React, { useRef, useState, useEffect } from 'react'
import Epub from 'epubjs'

import './index.styl'
import demoBook from './demo.epub'

export default ->
  reader = useRef()
  [{ book, render }, setEpub] = useState({})
  useEffect(->
    renderDom = reader.current
    { width, height } = renderDom.getBoundingClientRect()
    book = Epub(demoBook)
    render = book.renderTo(renderDom, {
      width, height
    })
    render.display()
    setEpub({ book, render })
    return
  , [])

  prevPage = ->
    render.prev()
  nextPage = ->
    render.next()
  
  pug"""
    #mess-reader
      .left(onClick = prevPage)
      .reader(ref = reader)
      .right(onClick = nextPage)
  """