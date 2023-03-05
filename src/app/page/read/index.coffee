import React, { useRef, useState, useEffect } from 'react'
import Epub from 'epubjs'

import './index.styl'
import Layout from '../../cmp/layout/index.coffee'
import { map } from '../../../lib/mess-router/index.coffee'
import CurrentBook from '../../mess/current-book.coffee'
import { pushState } from '../../../lib/history/index.coffee'

map.push('/read', ->
  reader = useRef()
  [{ book, render }, setEpub] = useState({})
  useEffect(->
    args = CurrentBook()
    pushState('/') unless args
    renderDom = reader.current
    { width, height } = renderDom.getBoundingClientRect()
    book = Epub()
    
    book.open(...args)
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
)