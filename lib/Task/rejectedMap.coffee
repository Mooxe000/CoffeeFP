Task = require './Task'

_rejectedMap = (f) ->
  {
    fork
    cleanup
  } = @

  new Task(

    (reject, resolve) ->

      fork(
        (a) -> reject f a
        (b) -> resolve b
      )

    cleanup

  )

module.exports = _rejectedMap
