
/*
 ----------------------------

	Scott Noel-Hemming
	CT131
	Sun 04/02/2006 18:26:57.12
	Project #5	Sum And Product (P.33)

 ----------------------------
 */

#include <iostream>
using namespace std;

int main()
{
	int num1, num2;

	cout << "Enter a number between -2,147,483,647 and 2,147,483,647: ";
	cin >> num1;
	cout << endl;

	cout << "Enter another number between -2,147,483,647 and 2,147,483,647: ";
	cin >> num2;
	cout << endl;

	cout << "The product of " << num1 << " and " << num2 << " is: " << (num1*num2) << "\n";
	cout << "The sum of " << num1 << " and " << num2 << " is: " << (num1+num2) << "\n";
	return 0;
}
