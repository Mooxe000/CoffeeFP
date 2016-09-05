#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
trace = require '../src/trace'
{
  map
  prop
  compose
} = require 'ramda'
{ Maybe } = require '../src/Maybe'

safeHead = (x) -> Maybe.of x[0]

streetName = compose(
  map prop 'street'
  safeHead
  prop 'addresses'
)

# Maybe null
echo 'Maybe null'
compose(
  map trace ''
  streetName
)
  addresses: []

echo '----'
echo ''

# Maybe "Shady Ln."
compose(
  map trace """
  Maybe "Shady Ln."
  """
  streetName
)
  addresses: [
    street: "Shady Ln."
    number: 4201
  ]
