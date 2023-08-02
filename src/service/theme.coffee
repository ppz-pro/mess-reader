import create_external_state from 'state_mini'
import color_list from 'src/constant/theme/color/index.coffee'

export useState_color = create_external_state color_list[1]

export change_iframe_color = ->
  style = useState_color.get().style
  iframe = document.getElementsByTagName('iframe')[0]?.contentDocument
  if iframe
    iframe.body.style.lineHeight = 1.8
    iframe.body.style.letterSpacing = '.06em'

    iframe.body.style.color = "rgb(#{style.color_base})"
    iframe.body.style.background = "rgb(#{style.color_back_base})"
  # else
  #   console.debug 'color changed, but no iframe'

# 设置 app 的颜色
change_app_color = (color) ->
  style = color.style
  document.body.style.setProperty '--color_base', style.color_base
  document.body.style.setProperty '--color_back_base', style.color_back_base
  document.body.style.setProperty '--alpha_slight', style.alpha_slight
  change_iframe_color()
# 现在就设置颜色
change_app_color useState_color.get()
# state_color 变时，再设置
useState_color.subscribe change_app_color
