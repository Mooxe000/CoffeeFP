#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
trace = require '../src/trace'
{ Maybe } = require '../src/Maybe'
{ IO } = require '../src/IO'
{
  split
  compose
  map
  last
  filter
  equals
  head
} = require 'ramda'

url = new IO ->
  # window.location.href
  "http://www.xxx.com/api/v1/todos?todoId=aabbccdd&todoStatus=false"

# toPairs = String -> [[String]]
toPairs = compose(
  map split '='
  split '&'
)

# params :: String -> [[String]]
params = compose(
  toPairs
  last
  split '?'
)

# findParam :: String -> IO Maybe [String]
findParam = (key) ->

  url.map compose(
    Maybe.of
    map last
    filter compose(
      equals key
      head
    )
    params
  )

findParam 'todoId'
.unsafePerformIO()
.map map trace ''
