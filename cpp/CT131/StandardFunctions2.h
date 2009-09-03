#include <iostream>
#include <string>
#include <cctype>
using namespace std;
typedef int FN_POINTER(int);
/*template<class Type> Type alert(int *stor_val, string sayWhat, Type param=0) {*/
int alert(FN_POINTER *stor_val, string sayWhat, int param=0) {
	return stor_val(param);
}

template<class Type> Type prompt(Type *stor_val, string sayWhat, int prec=0) {
	cout.setf(ios::fixed);
	if (prec > 0) {
		cout.setf(ios::showpoint);
	} else {
		cout.unsetf(ios::showpoint);
	}
	cout.precision(prec);
	cout << sayWhat << " ";
	cin >> *stor_val;
	cout << endl;
	return *stor_val;
}

bool shouldIContinue() {
	char shouldIContinue;
	do {
		prompt(&shouldIContinue, "\n\nContinue? ([Yy]|[Nn]):");
		shouldIContinue = toupper(shouldIContinue);
	} while (shouldIContinue != 'Y' && shouldIContinue != 'N');

	if (shouldIContinue == 'Y')
		return 1;
	else if (shouldIContinue == 'N')
		return 0;
}
