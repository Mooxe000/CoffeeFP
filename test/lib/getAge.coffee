echo = console.log
moment = require 'moment'
{
  Left
  Right
} = require '../../src/Either'
{ curry } = require 'ramda'

# getAge :: Date -> User -> Either String, Number
getAge = curry (now, user) ->
  birthdate = moment user.birthdate, 'YYYY-MM-DD'
  unless birthdate.isValid()
  then Left.of "Birth date could not be parsed"
  else Right.of now.diff birthdate, 'years'

module.exports = getAge
