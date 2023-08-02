import { E } from '@ppzp/utils.rc'
import { IconButton } from '../iconfont/index.coffee'
import './index.styl'

export default ({ state, className, children }) ->
  if state.value
    return E
      plass: ['dialog_container', className]
      onClick: (evt) ->
        if evt.currentTarget == evt.target
          state.set false
      children: E
        plass: 'dialog_wrapper'
        children: E._(
          E IconButton,
            className: 'dialog_btn_close'
            type: 'close'
            onClick: -> state.set false,
          children
        )
