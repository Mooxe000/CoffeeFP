delayed =
  unless typeof setImmediate is 'undefined'
  then setImmediate
  else(
    unless typeof process is 'undefined'
    then process.nextTick
    else setTimeout
  )

module.exports = delayed
