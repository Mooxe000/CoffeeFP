Task = require './Task'

_fold = (f, g) ->
  {
    fork
    cleanup
  } = @

  new Task(
    (reject, resolve) ->

      fork(
        (a) -> resolve f a
        (b) -> resolve g b
      )

    cleanup
  )

module.exports = _fold
