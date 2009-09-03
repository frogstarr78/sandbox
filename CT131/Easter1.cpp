/*********************************************************************************************
** Programmer: Jeff Watson									Date Modified: 4/1/05			**
**																							**
** Filename: Easter1.cpp																	**
** Description:																				**
** Assuming that a single Easter Basket can hold no more than 12 eggs, this program prompts **
** the user to enter the number of easter eggs they have and then calculates the number of  **
** easter baskets it will take to hold all of the eggs.                                     **
**																							**
*********************************************************************************************/

#include <iostream>
using namespace std;

int main()
{
	int Easter_Eggs, Basket_Size = 12;
	double Number_of_Baskets;

	cout << "Please enter the number of Easter Eggs you have: ";
	cin >> Easter_Eggs;
	cout << endl;

	Number_of_Baskets = Easter_Eggs / Basket_Size;

	cout << endl << "If you have " << Easter_Eggs; 
	cout <<  " Easter Eggs, then you will need " << Number_of_Baskets << " Easter Baskets!";
	cout << endl << endl << "Thanks for using the Easter Basket Calculator Program!" << endl;

	return 0;
}
