Task = (computation, cleanup) ->
  @fork = computation
  @cleanup = cleanup or ->
  @

module.exports = Task
