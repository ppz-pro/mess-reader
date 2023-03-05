import Event from '@ppzp/utils/event'

pushStateEvent = Event()
export pushState = () ->
  await Promise.all(pushStateEvent.emit(...arguments))
  history.pushState(...arguments)
pushState.listen = pushStateEvent.listen
