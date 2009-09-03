
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Friday 2006-05-12 21:30:53
*	Project	#6	Egg	(P.#)
*
****************************/


#include <iostream>
#include <fstream>
#include <istream>
#include <string>
#include <cctype>
#include <cassert>
#include <StandardFunctions.h>
using namespace std;


struct Eggs {
	int count, containers;
};

class EggFileReader {
public:
//---------------- global methods
	EggFileReader(char infile[20], char outfile[20]);
	EggFileReader() : containerSize(CONTINERMAX) {};

	void getInFileName() { 
		prompt(&inFileName, "Input file name:");
		open('r');
	}

	void getOutFileName() { 
		prompt(&outFileName, "Output file name:");
		open('w');
	}

	void close() {
		infile.close();
		outfile.close();
	}

	void overridePrompt() {
		prompt(&OVERRIDE, "Override CONTINERMAX of " + int2string(CONTINERMAX) + "?");
		if ( OVERRIDE )
			prompt(&containerSize, "How many eggs would you like to allow in a container?");
	}

	void dumpResult(ostream& stream, int count, int containers) {
		alert("If you have ", &count, stream); 
		alert(" eggs, then you will need ", &containers, stream);
		alert(" containers!", "\n", stream);
	}

	void readAndDump() {
		int eggNum;
		infile.seekg(0, ios::beg);
		while (!infile.eof()) {
			Eggs egg;
			infile >> eggNum;
			numContainers = calcContainers(eggNum);
			dumpResult(outfile, eggNum, numContainers);
			dumpResult(cout, eggNum, numContainers);
		}
	}

	int calcContainers(int eggs) {
		int containers = getNumContainers(eggs);
		if(getRemainderEggs(eggs) > 1)
			containers += 1;
		return containers;
	}

//---------------- member variables
	bool OVERRIDE;

private:
//---------------- local methods

	int	getNumContainers (int eggs) {
		return eggs / containerSize;
	}

	int	getRemainderEggs (int eggs) {
		return eggs % containerSize;
	}

	void open(char readWrite) {
		
		if (readWrite == 'r') {
			infile.open(inFileName);
			assert( !infile.fail() );
		} else {
			outfile.open(outFileName);
			assert( !outfile.fail() );
		}
	}

//---------------- member variables
	ifstream infile;
	ofstream outfile;
	char inFileName[30];
	char outFileName[30];
	static const int CONTINERMAX = 12;
	int containerSize, numContainers;

};


void thankYou();
void main() {

	EggFileReader eggReader;

	eggReader.getInFileName();
	eggReader.getOutFileName();
	eggReader.overridePrompt();
	eggReader.readAndDump();
	eggReader.close();

	thankYou("Eggs6");
}

