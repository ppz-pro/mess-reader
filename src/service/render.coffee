import { useMemo2 } from '@ppzp/utils.rc'
import create_external_state from 'state_mini'
import Epub from 'epubjs'

# Epub 实例
useState_book_instance = create_external_state()
export useValue_book_instance = -> useState_book_instance().value
# 设置 Epub 实例
export make_book = (source) ->
  if source
    book = Epub()
    book.open source # http://epubjs.org/documentation/0.3/#bookopen
    useState_book_instance.set2 book
  else
    useState_book_instance.set2 null
    useState_toc.set2 null

export useRender = ->
  book = useValue_book_instance()
  return useMemo2 [book], ->
    if book
      return (dom) ->
        { width } = dom.getBoundingClientRect()
        rendition = book.renderTo dom, {
          width
          flow: 'scrolled-doc'
          allowScriptedContent: true # 这个放在设置里，让用户开启好一点
        }

        rendition.display()
        navigation = await book.loaded.navigation
        useState_toc.set2 navigation.toc

# render 的 result
useState_toc = create_external_state()
export useValue_toc = -> useState_toc().value
