import create_external_state from 'state_mini'

useState_book_source = create_external_state()
export useValue_book_source = -> useState_book_source().value
export useSet_book_source = -> useState_book_source().set2
