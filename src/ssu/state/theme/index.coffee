import create_external_state from 'state_mini'
import color_list from './color_list/index.coffee'

export { color_list }
export useState_color = create_external_state color_list[1]

export change_app_color = (color) ->
  style = color.style
  document.body.style.setProperty '--color_base', style.color_base
  document.body.style.setProperty '--color_back_base', style.color_back_base
  document.body.style.setProperty '--alpha_slight', style.alpha_slight
  iframe = document.getElementsByTagName('iframe')[0]?.contentDocument
  return unless iframe
  iframe.body.style.color = "rgb(#{style.color_base})"
  iframe.body.style.background = "rgb(#{style.color_back_base})"

change_app_color useState_color.get()
useState_color.subscribe change_app_color
