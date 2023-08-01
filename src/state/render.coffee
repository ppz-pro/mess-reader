import { useMemo2 } from '@ppzp/utils.rc'
import create_external_state from 'state_mini'
import Epub from 'epubjs'
import { useState_color, color_list } from './theme/index.coffee'

# Epub 实例
useState_book_instance = create_external_state()
export useValue_book_instance = -> useState_book_instance().value
# 设置 Epub 实例
export make_book = (source) ->
  if source
    book = Epub()
    book.open source # http://epubjs.org/documentation/0.3/#bookopen
    useState_book_instance.set2 book
    useState_color.subscribe (color) ->
      # console.debug 'listened color changed', color
      book.rendition.themes.select color.name
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

        color_list.forEach (color) ->
          rendition.themes.register(color.name, {
            body:
              color: "rgb(#{color.style.color_base})"
              background: "rgb(#{color.style.color_back_base})"
          })
        rendition.themes.select useState_color.get().name

        rendition.display()
        navigation = await book.loaded.navigation
        useState_toc.set2 navigation.toc

# render 的 result
useState_toc = create_external_state()
export useValue_toc = -> useState_toc().value
