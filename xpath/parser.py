#!/usr/bin/python3.6

import lark

if __name__ == '__main__':
	xpath_ebnf = ''
	with open('xpath.ebnf', 'r') as f:
		xpath_ebnf = f.read()
	l = lark.Lark(xpath_ebnf)

	print(l.parse('//root'))
