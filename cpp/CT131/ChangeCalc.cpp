
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Wednesday 2006-04-26 21:57:15
*	Project	#5	ChangeCalc	(P.195)
*
****************************/


#include <iostream>
#include <StandardFunctions.h>
using namespace std;

const int QUARTER=25;
const int DIME=10;
const int PENNY=1;
const int AVAILCOINCOUNT=3;

void computeCoins(int*);
void compute_coin(int, int&, int&);
void err(int);

int main()
{
	int amount_left;
	int number=0;
	string result;
	bool doEnd=1;
	do {

		result = "";
		prompt(&amount_left, "How much change do you have left?");

		if( 0 < amount_left && amount_left < 100 ) {

		
				if ( amount_left > 25 ) {
					compute_coin(25, number, amount_left);

					result += int2string(number) + " Quarter";
					if(number > 1) 
						result += "s";
				}

				if ( amount_left > 10 ) {

					compute_coin(10, number, amount_left);
					if (result != "") {
						result += ", ";
						if (amount_left == 0) 
							result += "and ";
					}

					result += int2string(number) + " Dime";
					if(number > 1) result += "s";
				}

				if ( amount_left > 0 ) {
					compute_coin(1, number, amount_left);
					if (result != "") {
						result += ", and ";
					}
					result += int2string(number) + " Penn";
					result += (number > 1 ? "ies" : "y");
				}

				cout << "That would be " ;
				cout << result;
				cout << "." << endl;

		} else {
			err(amount_left);
		}

	} while ( shouldIContinue() );
}

void compute_coin (int coin_value, int& number, int& amount_left) {

//	Precondition: 0 < coin_value < 100 && 0 <= amount_left < 100.
//	Postcondition: number has been set equal to the maximum 
//	number of coins of denomination coin_value cents that can 
//	be obtained from amount_left cents. 
//	amount_left has been decreased by the value of the coins, 
//	that is, decreased by number*coin_value.

	number = amount_left / coin_value;
	amount_left -= number * coin_value;

}

void err (int amount_left) {
	cout << "Sorry 0 < " << amount_left << " && " 
		 << amount_left << " < 100 == false!" 
		 << endl; 
}
