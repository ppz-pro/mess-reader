import { E } from '@ppzp/utils.rc'
import './index.styl'

export default Radio = ({ state, name, value }) ->
  return E.input {
    type: 'radio'
    name
    value
    checked: state.value == value
    onChange: ->
      # https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/radio
      state.set2 value
  }

export RadioButtons = ({ options, state, name }) ->
  return E plass: 'radio_btns_container',
    options.map (option) ->
      if option.value == undefined
        # 格式化 value，如果 value 不存在 option 就是 value
        option = { value: option }
      if option.label == undefined
        # 格式化 label，如果 label 不存在 value 就是 label
        option.label = option.value
      E.label(
        E Radio, {
          state
          name
          value: option.value
        }
        E.span option.label
      )
