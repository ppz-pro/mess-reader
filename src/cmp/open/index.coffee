import { useRef } from 'react'
import { E, useState2 } from '@ppzp/utils.rc'
import { useSetState_current_book } from '../state.coffee'
import './index.styl'

export default ->
  return E.section plass: 'open',
    E plass: 'open_wrapper',
      E OpenFromLocal
      E OpenFromURI

OpenFromLocal = ->
  setState_current_book = useSetState_current_book()
  ref_input = useRef()
  return E plass: 'row local',
    E.button
      plass: 'link'
      onClick: -> ref_input.current.click()

      '打开本地文件'
    E.input
      ref: ref_input
      type: 'file'
      onChange: (evt) ->
        setState_current_book evt.target.files[0]

OpenFromURI = ->
  setState_current_book = useSetState_current_book()
  ref_input = useRef()
  state = useState2 ''
  return E plass: 'row uri',
    E.button
      plass: 'link'
      onClick: ->
        if state.value
          setState_current_book state.value
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
          setState_current_book state.value
