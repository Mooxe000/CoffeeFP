{ unimplemented } = require './Alias'
{
  Just
  Nothing
} = require './Implementation'

# -- Extracting and recovering
module.exports = (Maybe) ->

  # get
  Maybe::get = unimplemented
  Nothing::get = ->
    throw new TypeError "Can't extract the value of a Nothing."
  Just::get = -> @value

  # getOrElse
  Maybe::getOrElse = unimplemented
  Nothing::getOrElse = (a) -> a
  Just::getOrElse = (_) -> @value

  # orElse
  Maybe::orElse = unimplemented
  Nothing::orElse = (f) -> do f
  Just::orElse = (_) -> @

  # cata
  Maybe::cata = unimplemented
  Nothing::cata = (pattern) ->
    pattern.Nothing()
  Just::cata = (pattern) ->
    pattern.Just @value

  # toJSON
  Maybe::toJSON = unimplemented
  Nothing::toJSON = ->
    '#type': 'folktable:Maybe.Nothing'
  Just::toJSON = ->
    '#type': 'folktable:Maybe.Just'
    value: @value

  Maybe
