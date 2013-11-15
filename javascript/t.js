//var PEG = require('pegjs');
//var parser = require('./arithmetics');
//
//console.log( parser.parse('8*4') );

var http = require('http'),
	inspect = require('util').inspect;

var handle_result = function (state, id, code, successful) {
	console.log('handling ...');
	console.dir(arguments);
}

err_to_code = {
	'ECONREFUSED': 503,
	'ETIMEDOUT': 408
}
state = 'ok'
id    = '2'
s = 'http://somewhere.com'
s = 'http://example.com'
uri = require('url').parse(s);
req = http.request(uri, function(res) {
	handle_result(state, id, res.statusCode, http.STATUS_CODES[res.statusCode] == 'OK');
});

var err = function (e) {
	console.log('problem with request: ' + inspect(e) + ' to uri ' + inspect(uri));
	if ( err_to_code[e.message] != undefined ) {
		handle_result(state, id, err_to_code[e.message] , false);
	}
//	handle_result(state, id, e, false);
	console.log('timed out')
	console.dir(arguments);
}
req.setTimeout(1000, err);
//req.setTimeout(1000, function() {
//	handle_result(state, id, 408, false);
//});
req.on('error', err);
req.end();

