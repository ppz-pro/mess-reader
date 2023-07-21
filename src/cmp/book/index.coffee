
import { E, useEffect2 } from '@ppzp/utils.rc'
import { useRect } from '../../utils.coffee'
import { useValue_epub_book } from '../state.coffee'
import './index.styl'

export default ->
  book = useValue_epub_book()
  ref_viewer = useRect (rect) ->
    book.renderTo ref_viewer.current, rect
    .display()
  
  return E.section plass: 'book',
    E.header '标题'
    E.article
      ref: ref_viewer
