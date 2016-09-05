{ curry } = require 'ramda'
dd = require 'ddeyes'

Maybe = (x) ->
  @__value = x
  @
Maybe.of = (x) -> new Maybe x

Maybe::isNothing = -> (
  @__value is null
) or (
  @__value is undefined
)

Maybe::map = (f) ->
  if @isNothing()
  then Maybe.of null
  else Maybe.of f @__value

Maybe::join = ->
  if @isNothing()
  then Maybe.of null
  else @__value

Maybe::chain = (f) ->
  # f @__value
  @map f
  .join()
  # f @join @map

Maybe::ap = (Container) ->
  Container.map @__value

maybe = curry (x, f, m) ->
  if m.isNothing()
  then x
  else f m.__value

module.exports = {
  Maybe
  maybe
}
