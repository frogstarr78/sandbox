#include <iostream>
#include <cctype>
using namespace std;

bool main () {
	if  ('0' == '\0')
		cout << "'0' == '\0' yep" << endl;

	if  ('0' == 0)
		cout << "'0' == 0 yep" << endl;

	if  ('0' == static_cast<char>(0))
		cout << "'0' == static_cast<char>(0) yep" << endl;

	if  ('0' == static_cast<char>('\0'))
		cout << "'0' == static_cast<char>('\0') yep" << endl;

	if  ('0' == static_cast<int>('\0'))
		cout << "'0' == static_cast<int>('\0') yep" << endl;

	if  ('0' == static_cast<int>('0'))
		cout << "'0' == static_cast<int>('0') yep" << endl;

	if  ('0' == false)
		cout << "'0' == false yep" << endl;

	if  ('0' == static_cast<bool>(0))
		cout << "'0' == static_cast<bool>('0') yep" << endl;
}

int _main() {
	const int arraySize = 20;
	int target;
	int array[arraySize];

	// Array size and values already known.

//	int array[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
	array[0]  = 1;
	array[1]  = 2;
	array[2]  = 3;	// <---
	array[3]  = 4;	// <----
	array[4]  = 5;	// <-----
	array[5]  = 6; // <--
	array[6]  = 7;
	array[7]  = 8;
	array[8]  = 9;
	array[9]  = 10;
	array[10] = 11; // <-
	array[11] = 12;
	array[12] = 13;
	array[13] = 14;
	array[14] = 15;
	array[15] = 16;
	array[16] = 17;
	array[17] = 18;
	array[18] = 19;
	array[19] = 20;

	int first, mid, last;

	cout << "Enter a target to be found: ";
	cin >> target;

	// Initialize first and last variables.
	first = 0;
	last = arraySize;

	int i=0;
	while(first < last) {
		mid = (first + last)/2;
		cout << "mid " << mid << endl;
		cout << "midmod " << (mid%2) << endl;
		if(target > array[mid]) {
			first = mid;
		} else if(target < array[mid]) {
			last = mid;
		} else {
			break;
			first = last + 1;
		}
		cout << i++ << endl;
	}
  // When dividing can no longer proceed you are left with the
  // middle term. If the target equal that term you’re are
  // successful.

	if(target == array[mid]) {
		cout << "Target found." << endl;
	} else {
		cout << "Target not found." << endl;
	}

	return 0;
}
