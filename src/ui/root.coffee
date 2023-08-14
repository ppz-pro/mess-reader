import { E, useMount, useEffect2 } from '@ppzp/utils.rc'
import { useValue_book_instance, make_book, useValue_book_loading } from 'src/service/book.coffee'
import './root.styl'

import Header from './header/index.coffee'
import Nav from './nav/index.coffee'
import Book from './book/index.coffee'
import Open from './open/index.coffee'

export default ->
  loading = useValue_book_loading()
  book = useValue_book_instance()
  useMount ->
    link = new URLSearchParams(location.search).get 't'
    if link
      console.debug 'launch with download target', { link }
      make_book link
      return
    
    # root 挂载好后，检查是否为“通过双击 .epub 文件”来打开应用
    window.launchQueue?.setConsumer (params) ->
      make_book await params.files[0].getFile()
  
  return E plass: 'mess_reader_root',
    E Nav
    E plass: 'boxx',
      E Header
      if loading
        E plass: 'loading_book', '加载中...'
      else
        if book
          E Book
        else
          E Open
