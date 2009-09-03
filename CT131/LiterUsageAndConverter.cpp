
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Saturday 2006-04-15 21:55:17
*	Project	#1	LitreUsageAndConverter	(P.152)
*
****************************/


#include <iostream>
#include <StandardFunctions.h>
using namespace std;

const double litreDiff = 0.264179;

double gallons(double);
double mpg(int, double);

int main() {

	double litresUsed;
	int milesTraveled;

	do {
		
		cout.setf(ios::fixed);
		cout.setf(ios::showpoint);
		cout.precision(2);
		prompt(&litresUsed, "How many litres used? ", 2);
		prompt(&milesTraveled, "How many miles traveled? ");
		cout << litresUsed << " litres per " << milesTraveled << " miles travelled\n";
		cout.setf(ios::fixed);
		cout.setf(ios::showpoint);
		cout.precision(3);
		cout << "is " << milesTraveled << " miles per " << gallons(litresUsed) << " gallon\n";
		cout << "..or " << mpg(milesTraveled, litresUsed) << " miles/gallon.\n";
	} while ( shouldIContinue() );

	0;
}

double gallons(double litres) {
	return(litres * litreDiff);	
}

double mpg(int miles, double litres) {
	return(miles/gallons(litres));	
}
