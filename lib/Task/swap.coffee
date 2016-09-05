_swap = ->
  {
    fork
    cleanup
  } = @

  new Task(

    (reject, resolve) ->

      fork(
        (a) -> resolve a
        (b) -> reject b
      )

    cleanup
  )

module.exports = _swap
