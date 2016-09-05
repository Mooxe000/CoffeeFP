#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
trace = require '../src/trace'
{
  map
  add
  match
  prop
  compose
} = require 'ramda'
{ Maybe } = require '../src/Maybe'

# => Maybe ['a', 'a']
compose(
  map trace """
  Maybe ['a', 'a']
  """
  map match /a/ig
  Maybe.of
) 'Malkovich Malkovich'

echo '----'
echo ''

# => Maybe null
echo "Maybe null"
compose(
  map trace ''
  map match /a/ig
  Maybe.of
) null

echo '----'
echo ''

# => Maybe null
echo "Maybe null"
compose(
  map trace """
  Maybe: null
  """
  map add 10
  map prop 'age'
  Maybe.of
)
  name: 'Boris'

echo '----'
echo ''

compose(
  map trace 'Maybe: 24'
  map add 10
  map prop 'age'
  Maybe.of
)
  name: 'Dinah'
  age: 14
# => Maybe 24
