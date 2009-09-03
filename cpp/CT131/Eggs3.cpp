
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Sun 04/23/2006 
*	Project	#3	Eggs
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

const int CONTAINERMAX=12;

int askForEggs();
int getNumContainers(int);
int getNumContainers(int, int);
int getRemainderEggs(int);
int getRemainderEggs(int, int);

int main()
{
	
	int numEggs, containersNeeded, numContainers, remainderEggs, containerSize=CONTAINERMAX;
	char OVERRIDE;

	do {
		numEggs = askForEggs();
		prompt(&OVERRIDE, "Override CONTAINERMAX? [YT]");

		if (toupper(OVERRIDE) == 'T' || toupper(OVERRIDE) == 'Y')
			prompt(&containerSize, "How many eggs would you like to allow in a container?");

		numContainers = getNumContainers(numEggs, containerSize);	
		remainderEggs = getRemainderEggs(numEggs, containerSize);
			
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
	return eggs / CONTAINERMAX;
}
int getNumContainers (int eggs, int containerSize=CONTAINERMAX){
	return eggs / containerSize;
}
int	getRemainderEggs (int eggs) {
	return eggs % CONTAINERMAX;
}
int	getRemainderEggs (int eggs, int containerSize=CONTAINERMAX) {
	return eggs % containerSize;
}
