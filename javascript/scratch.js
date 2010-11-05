function ScratchLexer(text) {
	var words = text.split(/\s+/);
	var next = 0;
	this.nextWord = function () {
		if (next >= words.length) return null;
		return words[next++];
	};
}

function Scratch () {
	var dictionary = {};
	this.stack = [];

	this.addWords = function (new_dict) {
		for (var word in new_dict) {
			dictionary[word.toUpperCase()] = new_dict[word];
		}
	};

	this.run = function (text) {
		var lexer = new ScratchLexer(text);
		var word;
		var num_val;

		while (word = lexer.nextWord()) {
			word = word.toUpperCase();
			num_val = parseFloat(word);
			if (dictionary[word]) {
				dictionary[word](this);
			} else if (!isNaN(num_val)) {
				this.stack.push(num_val);
			} else {
				throw "Unknown word";
			}
		}
	};
}

PrintingWords = {
	"PRINT": function (terp) {
		if(terp.stack.length < 1)
			throw "Not enough items on stack"
		var tos = terp.stack.pop();
		print(tos);

	},
	"PSTACK": function (terp) {
		print(terp.stack)	
	}
};

var terp = new Scratch();
terp.addWords(PrintingWords);
terp.run("10 2 1 print print print");
print(terp.stack);
