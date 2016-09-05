{
  unimplemented
  noop
} = require './Alias'
{
  Just
  Nothing
} = require './Implementation'

# -- Conversions
module.exports = (Maybe) ->

  # fromNullable
  Maybe.fromNullable = (a) ->
    unless a is null
    then new Just a
    else new Nothing
  Maybe::fromNullable = Maybe.fromNullable

  # fromEither
  Maybe.fromEither = (a) ->
    a.fold Maybe.Nothing, Maybe.Just
  Maybe::fromEither = Maybe.fromEither

  # fromValidation
  Maybe.fromValidation = Maybe.fromEither
  Maybe::fromValidation = Maybe.fromEither

  # -- Predicates
  Maybe::isNothing = false
  Nothing::isNothing = true

  Maybe::isJust = false
  Just::isJust = true

  # -- Applicative
  Maybe.of = (a) -> new Just a
  Maybe::of = Maybe.of

  Maybe::ap = unimplemented
  Nothing::ap = noop

  Just::ap = (b) -> b.map @value

  # -- Functor
  Maybe::map = unimplemented
  Nothing::map = noop
  Just::map = (f) -> @of f @value

  # -- Chain
  Maybe::chain = unimplemented
  Nothing::chain = noop
  Just::chain = (f) -> f @value

  # -- Show
  Maybe::toString = unimplemented
  Nothing::toString = -> 'Maybe.Nothing'
  Just::toString = -> "Maybe.Just(#{@value})"

  # -- Eq
  Maybe::isEqual = unimplemented
  Nothing::isEqual = (b) -> b.isNothing
  Just::isEqual = (b) ->
    b.isJust and b.value is @value

  Maybe
