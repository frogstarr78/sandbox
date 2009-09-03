
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Tue 05/02/2006 
*	Project	#5	Eggs
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

#include <StandardFunctions.h>
#include <Console.h>
using namespace std;

const int containerMax = 12;

int calcContainers(int, int);
void showResult(int, int, int=0);
void getNumContainers(int&, int&, int&, int);

int main()
{

	
    using std::cout;
    using std::endl;
    
    namespace con = JadedHoboConsole;
    
	int numEggs, containersNeeded=0, containerSize = containerMax;
	bool OVERRIDE;

	do {
		prompt(&numEggs, "Please enter the number of Eggs you have:");
		prompt(&OVERRIDE, "Override container size [" + int2string(containerSize) + "] ?");
		if (OVERRIDE) {
			prompt(&containerSize, "How many eggs can be put in one container?");
		}
		containersNeeded = calcContainers(numEggs, containerSize);

	} while ( shouldIContinue() );
		cout << con::fg_red << "Thanks "
			 << con::fg_blue << "for "
			 << con::fg_cyan << "using "
			 << con::fg_black << con::bg_gray << "the"
			 << con::fg_green << con::bg_black << " Container "
			 << con::fg_yellow << "Calculator "
			 << con::fg_magenta << "Program!"
			 << con::fg_gray << con::bg_black
			 << endl;

		alert("\nThanks for using the Container Calculator Program!\n", "");

	return 0;
}

void showResult(int eggs, int containers, int remainder) {
	alert("If you have ", &eggs); 
	alert(" eggs, then you will need ", &containers);
	alert(" containers!", "\n");

	if(remainder > 0) {
		alert("You will have enough room for an additional ", &remainder);
		alert(" eggs", "\n");
	}
	
}

int calcContainers(int numEggs, int containerSize) {
	int origNumEggs = numEggs, containersNeeded=0, remainder=0;

		while (numEggs - containerSize >= 0) {
			getNumContainers(numEggs, containersNeeded, remainder, containerSize);
		};
		if (numEggs > 0)
			containersNeeded++;

		showResult(origNumEggs, containersNeeded, remainder);
		return containersNeeded;
}

void getNumContainers (int& eggs, int& containersNeeded, int& remainder, int containerSize) {
	eggs -= containerSize;
	containersNeeded++;
	remainder = containerSize - eggs;
}
