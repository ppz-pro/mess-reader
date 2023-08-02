import { E, useState2 } from '@ppzp/utils.rc'
import Dialog from '../../../common/dialog/index.coffee'
import Iconfont from '../../../common/iconfont/index.coffee'
import { RadioButtons } from '../../../common/form/radio/index.coffee'
import { useState_color, color_list } from '../../../../state/theme/index.coffee'
import './index.styl'

export default ->
  state_dialog_show = useState2 false
  state_color = useState_color()
  return E._(
    E.a
      plass: 'item icon'
      onClick: ->
        state_dialog_show.set true
      E Iconfont,
        plass: 'setting'
        title: '设置'
    E Dialog,
      plass: 'dialog_setting_theme'
      state: state_dialog_show

      E plass: 'fields',
        E plass: 'row',
          E plass: 'key', '颜色'
          E RadioButtons,
            state:
              value: state_color.value.name
              set2: (value) ->
                state_color.set2 color_list.find (color) -> color.name == value
            name: 'ppz'
            options: color_list.map (color) -> color.name
  )
