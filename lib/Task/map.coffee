Task = require './Task'

_map = (f) ->
  fork = @fork
  cleanup = @cleanup

  new Task(

    (reject, resolve) ->

      fork(
        (a) -> reject a
        (b) -> resolve f b
      )

    cleanup
  )

module.exports = _map
