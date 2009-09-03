
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Thursday 2006-04-20 22:44:46
*	Project	#6	InterestClass	(P.153)
*
****************************/


#include <iostream>
#include <cctype>
#include <StandardFunctions.h>
using namespace std;

char showMenu();

class InterestClass {
public:
	//public methods
	InterestClass() : counter(0), monthsLoan(0) {
		initVars();
	};

	void initVars() {
		cout << "\n";
		prompt(&initBal, "Initial Balance:");
		initBalStor = initBal;
		counter = 0;
		monthsLoan = 0;
		prompt(&interestRate, "Interest Rate:");
		prompt(&monthsLoan, "Months interest is to be paid:");
	}

	void showFiguredInterest () {
		alert("$", initBal, 2);
		alert(" for month #", counter);
		cout << endl;
	}

	void figureInterestForMonths () {
		do {
			figureInterest();
			showFiguredInterest();
		} while ( counter < monthsLoan );
	}

	double figureInterest() {
		counter++;
		initBal += initBal * interestRate;
		return initBal;
	}

private:
	// private methods
public:
	// public variables
	int counter;
private:
	// private variables
	double initBal, interestRate, initBalStor;
	int monthsLoan;
};

int main() {

	char menuOp;
	InterestClass interestObj;

	do {
		if (interestObj.counter >= 1) {
			menuOp = showMenu();
			switch(toupper(menuOp)) {
				case 'A':
					interestObj.figureInterestForMonths();
					break;
				case 'N':
					interestObj.figureInterest();
					interestObj.showFiguredInterest();
					break;
				case 'Q':
					cout << "Thank you for using our calculator." << endl;
					exit(1);
					break;
				case 'S':
					interestObj.initVars();
					break;
			}
		} else {
			interestObj.figureInterestForMonths();
		}
	} while (1);
	0;
}


char showMenu() {
	char menuOp;
	string menu = "\n\nCalculate...\n" \
				  "------------\n" \
				  "|\n" \
				  "+-[a]ll monththly figures.\n" \
				  "|\n" \
				  "+-[n]ext month figures.\n" \
				  "|\n" \
				  "+-[q]uit?\n" \
				  "|\n" \
				  "+-[s]tart Over?\n" \
				  "#";
	prompt(&menuOp, menu);
	return menuOp;
}
