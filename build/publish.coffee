{ build } = require 'esbuild'
{ publish } = require 'gh-pages'
options = require './index.coffee'

do ->
  await build options
  publish 'dist', (err) ->
    if err
      console.error err
    else
      console.log 'published'
  
  console.log 'publish...'
