{ clone } = require './Alias'
{
  Maybe
  Just
  Nothing
} = require './Implementation'

module.exports = ->

  Just.prototype = clone Maybe.prototype
  Nothing.prototype = clone Maybe.prototype

  # -- Constructors
  Maybe.Nothing = -> new Nothing
  Maybe::Nothing = Maybe.Nothing

  Maybe.Just = (a) -> new Just a
  Maybe::Just = Maybe.Just

  Maybe
