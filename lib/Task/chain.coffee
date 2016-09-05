Task = require './Task'

_chain = (f) ->

  fork = @fork
  cleanup = @cleanup

  new Task(

    (reject, resolve) ->

      fork(
        (a) -> reject a
        (b) ->
          f b
          .fork reject, resolve
      )

    cleanup
  )

module.exports = _chain
