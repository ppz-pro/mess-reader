import { useRef } from 'react'
import { E, useEffect2 } from '@ppzp/utils.rc'
import { render } from 'src/service/render.coffee'
import './index.styl'

export default ->
  ref_viewer = useRef()
  useEffect2 [ref_viewer], ->
    render ref_viewer.current
  
  return E.section plass: 'book',
    E.article E ref: ref_viewer
