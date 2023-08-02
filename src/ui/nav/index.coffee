import { E, useState2 } from '@ppzp/utils.rc'
import { useValue_book_instance, useValue_toc } from 'src/service/render.coffee'

import './index.styl'

export default ->
  return E.nav(
    E plass: 'drawer_container',
      E Toc
      E Recent
  )

Recent = ->
  state_expand = useExpand false
  
  return E style: state_expand.style,
    E
      plass: 'title'
      onClick: state_expand.toggle

      E '最近打开'
      E plass: 'triangle'
    E plass: 'body',
      'TODO: 这里是最近打开的书'

Toc = ->
  state_expand = useExpand true
  list = useValue_toc()
  book = useValue_book_instance()
  return list && E style: state_expand.style,
    E
      plass: 'title'
      onClick: state_expand.toggle
      
      E '本书目录'
      E plass: 'triangle'
    E plass: 'body',
      list.map (item) ->
        E.a
          key: item.id
          href: item.href
          title: item.label
          onClick: (evt) ->
            evt.preventDefault()
            book.rendition.display item.href
          item.label

useExpand = (init_value) ->
  state = useState2 init_value
  return {
    style:
      flexGrow: state.value && 1 || 0
      '--rotate': state.value && 'rotate(0deg)' || 'rotate(90deg)' # 垃圾写法
    toggle: -> state.set (value) -> !value
  }
