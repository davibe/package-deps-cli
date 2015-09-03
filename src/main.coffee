fs = require 'fs'
path = require 'path'
argv = require('yargs')
  .usage('Usage: $0 --deps --dev-deps [path to package (defaults to ./)]')
  .boolean('dev')
  .describe('dev', 'also output dev dependencies')
  .help('h')
  .alias('h', 'help')
  .argv

prefix = "./"
if argv._.length == 1 then prefix = argv[0]

fs.readFile path.join(prefix, 'package.json'), 'utf-8', (e, res) ->
  json = JSON.parse res
  for p, v of json.dependencies
    console.log "%s@%s", p, v
  if argv.dev
    for p, v of json.devDependencies
      console.log "%s@%s", p, v
