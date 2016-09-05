Task = require './Task'

_orElse = (f) ->
  {
    fork
    cleanup
  } = @

  new Task(

    (reject, resolve) ->

      fork(
        (a) ->
          f a
          .fork reject, resolve

        (b) -> resolve b
      )

    cleanup
  )

module.exports = _orElse
