{ curry } = require 'ramda'
dd = require 'ddeyes'
echo = console.log

trace = curry (tag, x) ->
  echo tag if tag
  # if x is null
  # then dd 'null'
  # else dd x
  dd x
  x

module.exports = trace
