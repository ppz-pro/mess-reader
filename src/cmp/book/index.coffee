import { useRef } from 'react'
import { E, useEffect2 } from '@ppzp/utils.rc'
import { useRender } from '../../state/render.coffee'
import './index.styl'

export default ->
  render = useRender()
  ref_viewer = useRef()
  useEffect2 [render, ref_viewer], ->
    render ref_viewer.current
  
  return E.section plass: 'book',
    E.article E ref: ref_viewer
