var PEG = require('pegjs');
var parser = require('./arithmetics');

console.log( parser.parse('8*4') );
