#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
{ Maybe } = require '../src/Maybe'
Task = require 'data.task'
trace = require '../src/trace'
{
  add
  map
} = require 'ramda'

dd add(
  Maybe.of 2
  Maybe.of 3
)

Maybe.of 2
.chain (two) ->
  Maybe.of 3
  .map add two
.map trace ''

Maybe.of add 2
.ap Maybe.of 3
.map trace ''

Maybe.of add
.ap Maybe.of 2
.ap Maybe.of 3
.map trace ''

Task.of add
.ap Task.of 2
.ap Task.of 3
.fork(
  (err) -> throw err
  (data) -> dd data
)
