#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
trace = require '../src/trace'
{
  map
  prop
  compose
} = require 'ramda'
{
  Maybe
  maybe
} = require '../src/Maybe'

# withdraw :: Number -> Account -> Maybe Account
withdraw = curry (amount, account) ->
  if account.balance >= amount
  then Maybe.of balance: account.balance - amount
  else Maybe.of null

# finishTransaction :: Account -> String
finishTransaction = compose(
  remainingBalance
  updateLedger
) # <- 假定这两个函数已经在别处定义好了

# getTwenty :: Account -> Maybe String
getTwenty = compose(
  map finishTransaction
  withdraw 20
)
# use maybe
getTwenty = compose(
  maybe "You're broke!" finishTransaction
  withdraw 20
)

getTwenty balance: 200.00
# Maybe 'Your balance is $180.00'

getTwenty balance: 10.00
# Maybe null
