#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
moment = require 'moment'
trace = require '../src/trace'
{
  add
  map
  concat
  compose
} = require 'ramda'

getAge = require './lib/getAge'

# fortune :: Number -> String
fortune = compose(
  concat 'If you survive, you will be '
  add 1
)

# zoltar :: User -> Either String, _
zoltar = compose(
  map fortune
  getAge moment()
)

# "If you survive, you will be 11"
# Right(undefined)
compose(
  map trace """
  "If you survive, you will be 11"
  """
  zoltar
)
  birthdate: '2005-12-12'

echo '----'
echo ''

# Left "Birth date could not be parsed"
compose(
  map trace """
  Left "Birth date could not be parsed"
  """
  zoltar
)
  birthdate: 'balloons!'
