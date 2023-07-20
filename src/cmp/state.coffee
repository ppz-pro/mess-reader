import create_external_state from 'state_mini'

export useState_current_book = create_external_state()
export useSetState_current_book = -> useState_current_book().set2
