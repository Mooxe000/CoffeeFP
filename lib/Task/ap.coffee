delayed = require './delayed'
Task = require './Task'

_ap = (that) ->

  forkThis = @fork
  forkThat = that.fork
  cleanupThis = @cleanup
  cleanupThat = that.cleanup

  cleanupBoth = (state) ->
    cleanupThis state[0]
    cleanupThat state[1]

  new Task(

    (reject, resolve) ->

      func = funcLoaded =
      val = valLoaded =
      rejected = false
      # allState;

      guardResolve = (setter) ->

        (x) ->
          return if rejected

          setter x

          if funcLoaded and valLoaded
            delayed ->
              cleanupBoth allState
              resolve func val
          else x

      guardReject = (x) ->
        unless rejected
          rejected = true
          reject x

      thisState = forkThis(
        guardReject
        guardResolve (x) ->
          funcLoaded = true
          func = x
      )

      thatState = forkThat(
        guardReject
        guardResolve (x) ->
          valLoaded = true
          val = x
      )

      allState = [
        thisState
        thatState
      ]

    cleanupBoth

  )

module.exports = _ap
