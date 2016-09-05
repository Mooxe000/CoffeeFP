#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
{
  curry
  compose
  map
  add
} = require 'ramda'
{ Maybe } = require '../src/Maybe'
trace = require '../src/trace'

# safeProp :: Key -> {Key: a} -> Maybe a
safeProp = curry (x, obj) ->
  new Maybe obj[x]

# safeHead :: [a] -> Maybe a
safeHead = safeProp 0

# firstAddressStreet :: User -> Maybe (Maybe (Maybe Street) )
firstAddressStreet = compose(
  map map safeProp 'street'
  map safeHead
  safeProp 'addresses'
)

firstAddressStreet
  addresses: [
    street:
      name: 'Mulburry'
      number: 8402
    postcode: "WC2N"
  ]
.map map map trace ''

join = (mma) -> mma.join()

firstAddressStreet = compose(
  join
  map safeProp 'street'
  join
  map safeHead
  safeProp 'addresses'
)

firstAddressStreet
  addresses: [
    street:
      name: 'Mulburry'
      number: 8402
    postcode: "WC2N"
  ]
.map trace ''

chain = curry (f, mma) ->
  mma.map f
  .join()

chain = curry (f, mma) ->
  mma.chain f

firstAddressStreet = compose(
  chain safeProp 'street'
  chain safeHead
  safeProp 'addresses'
)

firstAddressStreet
  addresses: [
    street:
      name: 'Mulburry'
      number: 8402
    postcode: "WC2N"
  ]
.map trace ''

Maybe.of 3
.chain (three) ->
  Maybe.of 2
  .map add three
.map trace ''
