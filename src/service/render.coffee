import create_external_state from 'state_mini'
import { get_book_instance } from './book.coffee'
import { set_iframe_color } from './theme.coffee'

# render 到 dom
export render = (dom) ->
  { width } = dom.getBoundingClientRect()
  book = get_book_instance()
  book.renderTo dom, {
    width
    flow: 'scrolled-doc'
    allowScriptedContent: true # 这个放在设置里，让用户开启好一点
  }
  book.rendition.on 'displayed', (section) ->
    # section: http://epubjs.org/documentation/0.3/#section
    # console.debug 'displayed', section.href
    useState_display_target.set2 section.href
  display()

# 当前章节
useState_display_target = create_external_state()
export useValue_display_target = -> useState_display_target().value
export display = (target) ->
  await get_book_instance().rendition.display target
  set_iframe_color()
