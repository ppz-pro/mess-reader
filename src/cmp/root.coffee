import { E } from '@ppzp/utils.rc'
import { useValue_epub_book } from './state.coffee'
import './root.styl'

import Nav from './nav/index.coffee'
import Book from './book/index.coffee'
import Open from './open/index.coffee'

export default ->
  book = useValue_epub_book()
  return E.div plass: 'mess_reader_root',
    E Nav
    if book
      E Book
    else
      E Open
