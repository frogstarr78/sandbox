
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Sun 04/23/2006 
*	Project	#4	Eggs
*
****************************/

/****************************
*
*	I do not celebrate Easter. 
*	I appologize I didn't realize sooner
*	that this involved Easter eggs. 
*	I hope there's no problem with this 
*	being a project about eggs in containers.
*
****************************/

#include <iostream>
#include <StandardFunctions.h>
using namespace std;

const int containerMax = 12;

int getNumContainers(int);
int getRemainderEggs(int);
int askForEggs();

int main()
{
	
	int numEggs, containersNeeded, numContainers, remainderEggs;
	bool OVERRIDE;

	do {
		numEggs = askForEggs();
		prompt(&OVERRIDE, "Override containerMax of " << containerMax << "?");
		numContainers = getNumContainers(numEggs);	
		remainderEggs = getRemainderEggs(numEggs);
			
		numContainers += (remainderEggs > 0);

		cout << "|" << endl;
		cout << "If you have " << numEggs; 
		cout << " eggs, then you will ";
		cout << "need " << numContainers << " containers!";
	} while ( shouldIContinue() );
		cout << "\n\nThanks for using the Container Calculator Program!" << endl;

	return 0;
}

int askForEggs(){
	int eggs;
	cout << "Please enter the number of Eggs you have: ";
	cin >> eggs;
	return eggs;
}
int	getNumContainers (int eggs) {
	return eggs / containerMax;
}
int	getRemainderEggs (int eggs) {
	return eggs % containerMax;
}
