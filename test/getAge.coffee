#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
moment = require 'moment'
trace = require '../src/trace'
{
  compose
  map
} = require 'ramda'

getAge = require './lib/getAge'

# Right 10
compose(
  map trace 'Right 10'
  getAge moment()
)
  birthdate: '2005-12-12'

echo '----'
echo ''

# Left "Birth date could not be parsed"
compose(
  map trace 'Left "Birth date could not be parsed"'
  getAge moment()
)
  birthdate: '20011704'
