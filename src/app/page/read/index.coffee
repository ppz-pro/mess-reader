import React, { useRef, useState, useEffect } from 'react'
import Epub from 'epubjs'

import './index.styl'
import Layout from '../../cmp/layout/index.coffee'
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
    
    render.on('keyup', onKeyup)
    document.addEventListener('keyup', onKeyup)
    return
  , [])

  onKeyup = ({ key }) ->
    if key == 'ArrowLeft'
      prevPage()
    else if key == 'ArrowRight'
      nextPage()
  prevPage = ->
    render.prev()
  nextPage = ->
    render.next()
  
  pug"""
    Layout.reader
      #mess-reader
        .left(onClick = prevPage)
        .reader(ref = reader)
        .right(onClick = nextPage)
  """