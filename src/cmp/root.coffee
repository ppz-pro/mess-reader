import { E, useMount } from '@ppzp/utils.rc'
import { useRender, make_book } from './state.coffee'
import './root.styl'

import Header from './header/index.coffee'
import Nav from './nav/index.coffee'
import Book from './book/index.coffee'
import Open from './open/index.coffee'

export default ->
  render = useRender()
  useMount open_file_onlaunch
  return E plass: 'mess_reader_root',
    E Nav
    E plass: 'boxx',
      E Header
      if render
        E Book
      else
        E Open

open_file_onlaunch = ->
  window.launchQueue?.setConsumer (params) ->
    make_book await params.files[0].getFile()
