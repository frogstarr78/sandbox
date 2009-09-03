#ifndef STDFUNCTIONS_H
#define STDFUNCTIONS_H

#include <iostream>
#include <string>
#include <cctype>
#include <Console.h>
using namespace std;

namespace noelhemming {

	template<class Type> void alert(string sayWhat, Type variable, ostream& stream=cout, int prec=0) {
		stream.setf(ios::fixed);
		if (prec > 0) {
			stream.setf(ios::showpoint);
		} else {
			stream.unsetf(ios::showpoint);
		}
		stream.precision(prec);
		stream << sayWhat << variable;
	}

	template<class Type> void alertn(string sayWhat, Type variable, ostream& stream=cout, int prec=0) {
		alert(sayWhat, variable, stream, prec);
		cout << endl;
	}

	template<class Type> void showArrayElement(int i, Type array[]){
		cout << " array[" << i << "] = " << array[i] << endl;
	}

	template<class Type> void compareVariables(Type var1, Type var2, char op='>') {
		cout << "(var1 = "
			 << var1;
			 switch (op) {
				case '>':
					cout << ") > ";
					break;
				case '=':
					cout << ") == ";
					break;
			 }
		 cout << " (var2 = "
			 << var2
			 << ") == ";
			 switch (op) {
				case '>':
					cout << (var1 > var2);
					break;
				case '=':
					cout << (var1 == var2);
					break;
			 }
		 cout << endl;
	}

	template<class Type> void prompt(Type& stor_val, string sayWhat, int prec=0) {
		cout.setf(ios::fixed);
		if (prec > 0) {
			cout.setf(ios::showpoint);
		} else {
			cout.unsetf(ios::showpoint);
		}
		cout.precision(prec);
		cout << sayWhat << " ";
		cin >> stor_val;
		cout << endl;
	}

	void prompt(bool& stor_val, string sayWhat, int prec=0) {
		char tmp_stor_val;
		cout.setf(ios::fixed);
		if (prec > 0) {
			cout.setf(ios::showpoint);
		} else {
			cout.unsetf(ios::showpoint);
		}
		cout.precision(prec);
		cout << sayWhat << " ";
		cin >> tmp_stor_val;
		cout << endl;
		stor_val = (toupper(tmp_stor_val) == 'Y' || 
					toupper(tmp_stor_val) == 'T' || 
					tmp_stor_val == '1') ? 1 : 0;
	}

	bool shouldIContinue() {
		char shouldIContinue;
		do {
			prompt(shouldIContinue, "\n\nContinue? (Yy|Nn):");
			shouldIContinue = toupper(shouldIContinue);
		} while (shouldIContinue != 'Y' && shouldIContinue != 'N');

		if (shouldIContinue == 'Y')
			return 1;
		return 0;
	}

	string int2string(int number) {
		char tmp[30];
		sprintf(tmp,"%d",number);
		return tmp;
	}

	void thankYou (string programName) {
		namespace con = JadedHoboConsole;
		cout << con::fg_red << "Thanks "
			 << con::fg_blue << "for "
			 << con::fg_cyan << "using "
			 << con::fg_black << con::bg_gray << "the"
			 << con::fg_green << con::bg_black << " "
			 << programName
			 << con::fg_magenta << " Program!"
			 << con::fg_gray << con::bg_black
			 << endl;
	}
} //end noelhemming namespace
#endif
