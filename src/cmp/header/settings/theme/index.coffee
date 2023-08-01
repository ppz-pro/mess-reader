import { E, useState2 } from '@ppzp/utils.rc'
import Dialog from '../../../common/dialog/index.coffee'
import Iconfont from '../../../common/iconfont/index.coffee'

export default ->
  state_dialog_show = useState2 false
  return E._(
    E.a
      plass: 'item icon'
      onClick: ->
        state_dialog_show.set true
      E Iconfont,
        plass: 'setting'
        title: '设置'
    E Dialog, state: state_dialog_show,
      'children'
  )
