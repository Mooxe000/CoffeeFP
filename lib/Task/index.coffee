# Task
Task = require './Task'

{
  _of
  _rejected
  _empty
  _toString
  _cata
} = require './simple'

_map = require './map'
_chain = require './chain'
_ap = require './ap'

_concat = require './concat'
_orElse = require './orElse'
_fold = require './fold'
_swap = require './swap'
_bimap = require './bimap'
_rejectedMap = require './rejectedMap'

Task.of =
Task::of = _of
Task.rejected =
Task::rejected = _rejected

Task::map = _map
Task::chain = _chain
Task::ap = _ap

Task::concat = _concat

Task.empty =
Task::empty = _empty
Task::toString = _toString

Task::orElse = _orElse
Task::fold = _fold
Task::cata = _cata
Task::swap = _swap
Task::bimap = _bimap
Task::rejectedMap = _rejectedMap

module.exports = Task
