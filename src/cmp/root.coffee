import { E } from '@ppzp/utils.rc'
import { useValue_book_source } from './state.coffee'
import './root.styl'

import Book from './book/index.coffee'
import Open from './open/index.coffee'

export default ->
  book_source = useValue_book_source()
  return E.div plass: 'mess_reader_root',
    if book_source
      E Book
    else
      E Open
