import { useRef } from 'react'
import { E, useState2 } from '@ppzp/utils.rc'
import { useSet_book_source } from '../state.coffee'
import './index.styl'

export default ->
  return E.section plass: 'open',
    E plass: 'open_wrapper',
      E OpenFromLocal
      E OpenFromURI

OpenFromLocal = ->
  set_book_source = useSet_book_source()
  ref_input = useRef()
  return E plass: 'row local',
    E.button
      plass: 'link'
      onClick: ->
        if window.FileReader
          ref_input.current.click()
        else
          alert '你的浏览器不支持“从本地打开”，推荐使用 Edge 或 Chrome'
      
      '打开本地文件'
    E.input
      ref: ref_input
      type: 'file'
      onChange: (evt) ->
        reader = new FileReader()
        reader.onload = (evt) ->
          set_book_source evt.target.result
        reader.readAsArrayBuffer evt.target.files[0] 

OpenFromURI = ->
  set_book_source = useSet_book_source()
  ref_input = useRef()
  state = useState2 ''
  return E plass: 'row uri',
    E.button
      plass: 'link'
      onClick: ->
        if state.value
          set_book_source state.value
        else
          alert '输入下载链接先'
          ref_input.current.focus()
      
      '打开网络文件'

    E.input
      ref: ref_input
      value: state.value
      placeholder: '输入电子书链接'
      onChange: (evt) -> state.set evt.target.value
      onKeyDown: (evt) ->
        if evt.keyCode == 13
          set_book_source state.value
