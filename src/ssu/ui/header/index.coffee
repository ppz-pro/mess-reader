import { E } from '@ppzp/utils.rc'
import { make_book, useRender } from '../../state/render.coffee'
import Settings from './settings/theme/index.coffee'
import Icon from '../common/iconfont/index.coffee'

import './index.styl'

export default ->
  render = useRender()

  return E.header(
    E plass: 'header_wrapper',
      render && E
        plass: 'item'
        onClick: -> make_book()
        '换一本'
      
      E.a
        plass: 'item'
        target: '_blank'
        href: 'https://zlibrary-asia.se/'
        'Z Library'
      
      E Settings
      
      E.a
        plass: 'item icon'
        target: '_blank'
        href: 'https://github.com/ppz-pro/mess-reader'
        E Icon, plass: 'github', title: 'Github'
      
  )
