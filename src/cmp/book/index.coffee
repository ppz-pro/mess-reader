
import { E, useEffect2 } from '@ppzp/utils.rc'
import Epub from 'epubjs'
import { useRect } from '../../utils.coffee'
import { useValue_book_source } from '../state.coffee'
import './index.styl'

export default ->
  book_source = useValue_book_source()
  ref_viewer = useRect (rect) ->
    book = Epub()
    book.open book_source # http://epubjs.org/documentation/0.3/#bookopen
    book.renderTo ref_viewer.current, rect
    .display()
  
  return E.section plass: 'book',
    E plass: 'title',
      '标题'
    E
      plass: 'viewer'
      ref: ref_viewer
