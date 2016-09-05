{
  unimplemented
  noop
} = require './Alias'

Constructors = require './Constructors'
Conversions = require './Conversions'
ExtractingAndRecovering =
  require './ExtractingAndRecovering'

Maybe = ExtractingAndRecovering(
  Conversions Constructors()
)

module.exports = Maybe
