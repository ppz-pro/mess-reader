import { E, useEffect2, useState2 } from '@ppzp/utils.rc'
import { useValue_epub_book } from '../state.coffee'
import './index.styl'

export default ->
  return E.nav(
    E plass: 'drawer_container',
      E Recent
      E Toc
  )

Recent = ->
  state_expand = useExpand()
  
  return E style: state_expand.style,
    E
      plass: 'title'
      onClick: state_expand.toggle

      E '最近打开'
      E plass: 'triangle'
    E plass: 'body',
      '这里是最近打开的书'

Toc = ->
  book = useValue_epub_book()
  state_expand = useExpand()

  state_toc = useState2()
  useEffect2 [book], ->
    return unless book
    toc = await book.loaded.navigation

  return E style: state_expand.style,
    E
      plass: 'title'
      onClick: state_expand.toggle
      
      E '本书目录'
      E plass: 'triangle'
    E plass: 'body',
      '这里是本书的章节目录'

useExpand = ->
  state = useState2 true
  return {
    style:
      flexGrow: state.value && 1 || 0
      '--rotate': state.value && 'rotate(0deg)' || 'rotate(90deg)' # 垃圾写法
    toggle: -> state.set (value) -> !value
  }
