import { E } from '@ppzp/utils.rc'
import { useState_current_book } from '../state.coffee'

# http://epubjs.org/documentation/0.3/#bookopen
export default ->
  book = useState_current_book()
  return E.section plass: 'book',
    'book'
