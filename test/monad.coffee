#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
fs = require 'fs'
{
  compose
  map
  head
} = require 'ramda'
{ IO } = require '../src/IO'

# readFile :: String -> IO String
readFile = (filename) ->
  new IO ->
    fs.readFileSync filename, 'utf-8'

# print :: String -> IO String
print = (x) ->
  new IO ->
    console.log x
    x

# cat :: IO (IO String)
cat = compose(
  map print
  readFile
)

cat './lib/getAge.coffee'
.unsafePerformIO()
.unsafePerformIO()

echo ''
echo '----'
echo ''

# cat :: String -> IO (IO String)
cat = compose(
  map print
  readFile
)

# catFirstChar :: String -> IO (IO String)
catFirstChar = compose(
  map map head
  cat
)

dd(
  catFirstChar './lib/getAge.coffee'
  .unsafePerformIO()
  .unsafePerformIO()
)

echo ''
echo '----'
echo ''

catFirstCharO = compose(
  map print
  map head
  readFile
)

catFirstCharO './lib/getAge.coffee'
.unsafePerformIO()
.unsafePerformIO()

echo ''
echo '----'
echo ''

catFirstCharO = compose(
  map head
  map map print
  readFile
)

catFirstCharO './lib/getAge.coffee'
.unsafePerformIO()
.unsafePerformIO()
