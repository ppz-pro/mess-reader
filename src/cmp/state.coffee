import { useEffect2 } from '@ppzp/utils.rc'
import create_external_state from 'state_mini'
import Epub from 'epubjs'

# book source: 本地文件、网络链接
useState_book_source = create_external_state()
export useSet_book_source = -> useState_book_source().set2

# Epub 实例
useState_epub_book = create_external_state()
export useValue_epub_book = -> useState_epub_book().value
# 监听 source，设置 Epub 实例
useState_book_source.subscribe (source) ->
  if source
    book = Epub()
    book.open source # http://epubjs.org/documentation/0.3/#bookopen
    useState_epub_book.set2 book
  else
    useState_epub_book.set2 null
