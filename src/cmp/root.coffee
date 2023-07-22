import { E } from '@ppzp/utils.rc'
import { useRender } from './state.coffee'
import './root.styl'

import Nav from './nav/index.coffee'
import Book from './book/index.coffee'
import Open from './open/index.coffee'

export default ->
  render = useRender()
  return E.div plass: 'mess_reader_root',
    E Nav
    if render
      E Book
    else
      E Open
