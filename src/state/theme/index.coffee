import create_external_state from 'state_mini'
import color_list from './color_list/index.coffee'

export { color_list }
export useState_color = create_external_state color_list[0]
