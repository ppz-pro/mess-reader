import { useRef } from 'react'
import { useMount } from '@ppzp/utils.rc'

export useRect = (cb) ->
  ref = useRef()
  useMount ->
    { width, height } = ref.current.getBoundingClientRect()
    cb { width, height }
  return ref
