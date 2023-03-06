import React, { useRef, useState, useEffect } from 'react'
import Epub from 'epubjs'

import './index.styl'
import { nav2 } from '../../../../lib/mess-router/index.coffee'
import CurrentBook from '../../../mess/current-book.coffee'

export default ->
  reader = useRef()
  [{ book, render }, setEpub] = useState({})
  useEffect(->
    args = CurrentBook()
    unless args
      nav2('/')
      return

    renderDom = reader.current
    { width, height } = renderDom.getBoundingClientRect()
    book = Epub()
    
    book.open(...args)
    console.log({ width, height})
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
    #mess-reader
      .left(onClick = prevPage)
      .reader(ref = reader)
      .right(onClick = nextPage)
  """