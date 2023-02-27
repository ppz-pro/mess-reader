import Epub from 'epubjs'

import './index.styl'
import demoBook from './demo.epub'

book = Epub(demoBook)
render = book.renderTo('book', {
  flow: 'paginated'
})
render.display()
