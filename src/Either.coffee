echo = console.log

Left = (x) -> @__value = x
Left.of = (x) -> new Left x
Left::map = (f) ->
  f @__value
  @

Right = (x) -> @__value = x
Right.of = (x) -> new Right x
Right::map = (f) -> Right.of f @__value

module.exports = {
  Left
  Right
}
