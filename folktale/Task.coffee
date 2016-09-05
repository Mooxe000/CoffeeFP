#!/usr/bin/env coffee
dd = require 'ddeyes'
trace = require '../src/trace'
{ compose } = require 'ramda'

Task = require '../lib/Task/index'

fs = require 'fs'
{
  split
  head
} = require 'ramda'

# readFile :: String -> Task Error, JSON
readFile = (filename) ->

  new Task (reject, result) ->

    fs.readFile(
      filename
      'utf-8'

      (err, data) ->
        if err
        then reject err
        else result data
    )

readFile "metamorphosis"
.map split '\n'
.map head
.fork(
  (err) -> throw err
  (data) -> dd data
)

Task.of 3
.map (three) -> three + 1
.fork(
  (err) -> throw err
  (data) -> dd data
)
