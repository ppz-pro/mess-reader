import { E } from '@ppzp/utils.rc'
import { useState_current_book } from './state.coffee'
import './root.styl'

import Book from './book/index.coffee'
import Open from './open/index.coffee'

export default ->
  current_book = useState_current_book()
  return E.div plass: 'mess_reader_root',
    if current_book.value
      E Book
    else
      E Open
