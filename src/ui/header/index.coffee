import { E } from '@ppzp/utils.rc'
import { make_book, useValue_book_instance } from 'src/service/book.coffee'
import Settings from './settings/theme/index.coffee'
import Icon from '../common/iconfont/index.coffee'

import './index.styl'

export default ->
  book = useValue_book_instance()

  return E.header(
    E plass: 'header_wrapper',
      book && E.a
        plass: 'item'
        href: 'javascript:void(0)'
        onClick: -> make_book()
        '换一本'
      
      E.a
        plass: 'item'
        target: '_blank'
        href: 'https://zlibrary-asia.se/'
        'Z Library'
      
      E.a
        plass: 'item icon'
        target: '_blank'
        href: 'https://github.com/ppz-pro/mess-reader'
        E Icon, plass: 'github', title: 'Github'
      
      E Settings
      
  )
