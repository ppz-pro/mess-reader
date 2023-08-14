import create_external_state from 'state_mini'
import Epub from 'epubjs'

# Epub 实例
useState_book_instance = create_external_state()
export useValue_book_instance = -> useState_book_instance().value
export get_book_instance = -> useState_book_instance.get()

# loading
useState_book_loading = create_external_state()
export useValue_book_loading = -> useState_book_loading().value

# 书的目录
useState_toc = create_external_state()
useState_book_instance.subscribe (book) ->
  useState_toc.set2 null
  navigation = await book.loaded.navigation
  useState_toc.set2 navigation.toc
export useValue_toc = -> useState_toc().value

# 设置 Epub 实例
export make_book = (source) ->
  if source
    book = Epub()
    useState_book_loading.set2 true
    await book.open source # http://epubjs.org/documentation/0.3/#bookopen
    useState_book_loading.set2 false
    useState_book_instance.set2 book
  else
    useState_book_instance.set2 null
    useState_toc.set2 null
