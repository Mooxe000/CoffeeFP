delayed = require './delayed'
Task = require './Task'

_concat = (that) ->

  forkThis = @fork
  forkThat = that.fork
  cleanupThis = @cleanup
  cleanupThat = that.cleanup

  cleanupBoth = (state) ->
    cleanupThis state[0]
    cleanupThat state[1]

  new Task(

    (reject, resolve) ->

      done = false

      guard = (f) ->
        (x) ->
          unless done
            done = true
            delayed ->
              cleanupBoth allState
            f x

      thisState = forkThis(
        guard reject
        guard resolve
      )

      thatState = forkThat(
        guard reject
        guard resolve
      )

      allState = [
        thisState
        thatState
      ]

    cleanupBoth
  )

module.exports = _concat
