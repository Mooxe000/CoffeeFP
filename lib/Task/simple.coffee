Task = require './Task'

_of = (b) ->
  new Task (_, resolve) ->
    resolve b

_rejected = (a) ->
  new Task (reject) ->
    reject a

_empty = ->
  new Task ->

_toString = -> 'Task'

_cata = (pattern) ->
  @fold(
    pattern.Rejected
    pattern.Resolved
  )

module.exports = {
  _of
  _rejected
  _empty
  _toString
  _cata
}
