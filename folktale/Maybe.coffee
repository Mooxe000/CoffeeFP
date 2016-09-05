#!/usr/bin/env coffee
dd = require 'ddeyes'

# We load the library by "require"-ing it
Maybe = require '../lib/Maybe/index.coffee'
{
  Just
  Nothing
} = Maybe

# Returns Maybe.Just(x) if some `x` passes the predicate test
# Otherwise returns Maybe.Nothing()
find = (predicate, xs) ->
  xs.reduce(

    (result, x) ->
      result.orElse ->

        if predicate x
        then Maybe.Just x
        else Maybe.Nothing() # otherwise

    Maybe.Nothing()
  )

numbers = [1, 2, 3, 4, 5]

anyGreaterThan2 = find(
  (a) -> a > 2
  numbers
)
# => Maybe.Just(3)

dd anyGreaterThan2

anyGreaterThan8 = find(
  (a) -> a > 8
  numbers
)
# => Maybe.Nothing

dd anyGreaterThan8
