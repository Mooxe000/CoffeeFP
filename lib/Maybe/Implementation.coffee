# -- Implementation
Maybe = ->
Just = (a) ->
  @value = a
  @
Nothing = ->

module.exports = {
  Maybe
  Just
  Nothing
}
