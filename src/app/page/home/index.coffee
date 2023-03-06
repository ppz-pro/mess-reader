import React, { useState, useRef } from 'react'

import './index.styl'
import Layout from '../../cmp/layout/index.coffee'
import { map, nav2 } from '../../../lib/mess-router/index.coffee'
import CurrentBook from '../../mess/current-book.coffee'

map.push('/', ->
  onBookProvider = ->
    CurrentBook(arguments)
    nav2('/read')

  pug"""
    Layout.home-page
      main
        FileFromLocal(onBookProvider = onBookProvider)
        FileFromURI(onBookProvider = onBookProvider)
  """
)

FileFromLocal = ({ onBookProvider }) ->
  input = useRef()
  onFileChange = (evt) ->
    file = evt.currentTarget.files[0]
    return unless file
    return alert('你的浏览器不支持从本地打开') unless window.FileReader

    fr = new FileReader()
    fr.onload = (evt) ->
      onBookProvider(evt.target.result, 'binary')
    fr.readAsArrayBuffer(file)
  return pug"""
    .item
      input(type = 'file' ref = input onChange = onFileChange)
      button(onClick = () => input.current.click()) 打开本地文件
  """

FileFromURI = ({ onBookProvider }) ->
  [uri, setURI] = useState()
  loadBook = ->
    return alert('输入链接先') unless uri
    onBookProvider(uri)
  return pug"""
    .item
      button(onClick = loadBook) 打开网络文件
      input(placeholder = '输入链接' onChange = (evt) => setURI(evt.currentTarget.value))
  """
