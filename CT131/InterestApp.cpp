
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Thursday 2006-04-20 22:44:46
*	Project	#6	InterestApp	(P.153)
*
****************************/


#include <iostream>
#include <cctype>
#include <StandardFunctions.h>
using namespace std;

double figureInterest(double, double, int);
char showMenu();
void showFiguredInterest (double, int);

int main() {

	double initBal, interestRate, initBalStor;
	int monthsLoan, counter=0;
	char menuOp;

	prompt(&initBal, "Initial Balance:");
	initBalStor = initBal;
	prompt(&interestRate, "Interest Rate:");
	prompt(&monthsLoan, "Months interest is to be paid:");

	do {
		if (counter >= 1) {
			menuOp = showMenu();
			switch(toupper(menuOp)) {
				case 'A':
					while ( counter < monthsLoan ) {
						counter++;
						initBal = figureInterest(initBal, interestRate, monthsLoan);
						showFiguredInterest(initBal, counter);
					}
					break;
				case 'N':
				case 'O':
					counter++;
					initBal = figureInterest(initBal, interestRate, counter);
					showFiguredInterest(initBal, counter);
					break;
				case 'Q':
					cout << "Thank you for using our calculator." << endl;
					exit(1);
					break;
				case 'S':
					counter = 0;
					prompt(&initBal, "Initial Balance:");
					initBalStor = initBal;
					prompt(&interestRate, "Interest Rate:");
					prompt(&monthsLoan, "Months interest is to be paid:");
					break;
				default:
					break;
			}
		} else {
			while ( counter < monthsLoan ) {
				counter++;
				initBal = figureInterest(initBal, interestRate, monthsLoan);
				showFiguredInterest(initBal, counter);
			} 
		}
	} while (1);
	0;
}

void showFiguredInterest (double bal, int month) {
	alert("$", &bal, 2);
	alert(" for month #", &month);
	cout << endl;
}

void figureInterestForMonths () {

}

double figureInterest(double initBal, double interestRate, int monthsLoan=0) {
	return initBal * interestRate + initBal;
}

char showMenu() {
	char menuOp;
	string menu = "Calculate...\n" \
				  "...[a]ll monththly figures.\n" \
				  "...[n]ext month figures.\n" \
				  "...[o]ne month figures.\n" \
				  "[Q]uit?\n" \
				  "[S]tart Over?\n";
	prompt(&menuOp, menu);
	return menuOp;
}
