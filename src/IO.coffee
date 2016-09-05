echo = console.log
{ compose } = require 'ramda'
IO = (f) ->
  @unsafePerformIO = f
  @
IO.of = (x) ->
  new IO -> x
IO::map = (f) ->
  # echo @__value
  new IO compose(
    f
    @unsafePerformIO
  )

module.exports = {
  IO
}
