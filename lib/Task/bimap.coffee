Task = require './Task'

_bimap = (f, g) ->
  {
    fork
    cleanup
  } = @

  new Task(

    (reject, resolve) ->

      fork(
        (a) -> reject f a
        (b) -> resolve g b
      )

    cleanup
  )

module.exports = _bimap
