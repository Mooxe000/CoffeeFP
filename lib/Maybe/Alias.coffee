# -- Aliases
clone = Object.create
unimplemented = ->
  throw new Error 'Not implemented.'
noop = -> @

module.exports = {
  clone
  unimplemented
  noop
}
