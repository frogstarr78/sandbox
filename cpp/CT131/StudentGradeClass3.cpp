
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Wednesday 2006-05-17 00:39:33
*	Project	#2	StudentGradeClass	(P.330)
*
****************************/

#include <iostream>
#include <fstream>
#include <map>
#include <cassert>
#include <cctype>
#include <StandardFunctions.h>
using namespace std;

class Grade { 
	float maxScore, gradeWeight, receivedGrade, weightedGrade;
	string assignmentName;

	float calcWeightedGrade(float grade) {
		return grade * gradeWeight;
	}
	
public:
	Grade(float weight, float score, float grade=0.0) : gradeWeight(weight), maxScore(score), receivedGrade(grade)  {};
	Grade() : gradeWeight(0.125), maxScore(10.0), receivedGrade(0.0) {};

	void setGrade(float grade){
		this->receivedGrade = grade/maxScore;
		this->weightedGrade = this->calcWeightedGrade(receivedGrade);
	}
	void setName (string name) {
		assignmentName = name;
	}

	float getGrade() { return this->receivedGrade; }
	float getWeightedGrade () { return this->weightedGrade; }
	string getName () { this->assignmentName; }
};

class Midterm : public Grade {
	public:
		Midterm(float weight, float score=100.0, float grade=0.0) : Grade(weight, score, grade) {};
		Midterm() : Grade(0.25, 100.0) {};
};

class Final : public Midterm {
	public:
		Final() : Midterm(0.50) {};
};

class StudentRecord {
		char letterGrade;
		float grade;
		string lastName, firstName;
		Grade quiz[2], final, midterm;

	public:

		StudentRecord(string lName, string fName, Grade quizGrades[2], Midterm midtermGrade, Final finalGrade) {
			lastName = lName;
			firstName = fName;
			quiz[0] = Grade();
			quiz[1] = Grade();
			midterm = Midterm();
			final = Final();

/*			this->setGrade<Grade, float, int>(quizGrades[0], 0);
			this->setGrade<Grade, float, int>(quizGrades[1], 1);
			this->setGrade<Midterm, float>(midtermGrade);
			this->setGrade<Final, float>(finalGrade);*/
		};

		StudentRecord() : letterGrade('X'), grade(0.0) {
			quiz[0] = Grade();
			quiz[1] = Grade();
			midterm = Midterm();
			final = Final();
		};

		void setQuizGrade(float grade, int index) { quiz[index].setGrade(grade);	}
		Grade getQuiz(int index) { return quiz[index]; }

		void setMidtermGrade(float grade) { midterm.setGrade(grade); }
		Midterm getMidterm() { return midterm; }

		void setFinalGrade(float grade) { final.setGrade(grade); }
		Final getFinalGrade() { return final; }
		
		float calcGrade () {
			float quizes = ((quiz[0].getGrade() + quiz[1].getGrade()) / 2) * 0.25;
			float midtermGrade = midterm.getWeightedGrade();
			float finalGrade = final.getWeightedGrade();

			alert("quizes ", &quizes, cout, 2);
			alert("midterm ", &midtermGrade, cout, 2);
			alert("final ", &finalGrade, cout, 2);

			grade = quizes + midtermGrade + finalGrade;

			return grade; // ! NOT CORRECT !
		}

		char figureLetterGrade () {
			if (grade > 0.9)
				return 'A';
			else if (0.9 > grade && grade > 0.8)
				return 'B';
			else if (0.8 > grade && grade > 0.7)
				return 'C';
			else if (0.7 > grade && grade > 0.6)
				return 'D';
			else if (0.6 > grade)
				return 'F';
			else 
				return 'X';
		}

	void setLastName(string lName) {
		this->lastName = lName;
	}
	string getLastName () { return this->lastName; }

	void setFirstName(string fName) {
		firstName = fName;
	}
	string getFirstName () { return firstName; }
};

class StudentFile {
		ifstream instream;
		ofstream outstream;
		StudentRecord* records;
		char header[6][20];

		void handleLine (istream& stream, int counter) {
			float grade;
			string name;

			cout.setf(ios::fixed);
			cout.unsetf(ios::showpoint);
			cout.precision(2);

			stream >> name;
			records[counter].setLastName(name);
			alert("lastName: ", records[counter].getLastName());
			alert("", ' ');

			stream >> name;
			records[counter].setFirstName(name);
			alert("firstName: ", records[counter].getFirstName());

			cout.setf(ios::showpoint);
			cout.precision(2);
			stream >> grade;
			records[counter].setQuizGrade(grade, 0);
			cout << "quiz#1: " << records[counter].getQuiz(0) << " ";

			stream >> grade;
			records[counter].setQuizGrade(grade, 1);
			alert("quiz#2: ", records[counter].getQuiz(1), cout, 2);
			alert("", ' ');

			stream >> grade;
			records[counter].setMidtermGrade(grade);
			alert("midterm: ", records[counter].getMidterm(), cout, 2);
			alert("", ' ');

			stream >> grade;
			records[counter].setFinalGrade(grade);
			alert("final: ", records[counter].getFinal().getWeightedGrade(), cout, 2);
			alert("", ' ');

			cout << "grade/100: " << records[counter].calcGrade() << endl;
			cout << "letterGrade: " << records[counter].figureLetterGrade() << endl;

			cout << endl;
		}

	void readHeaderLn (ifstream& fhandle) {

		fhandle >> header[0]; //lastName
		fhandle >> header[1]; //firstName
		fhandle >> header[2]; //quiz1
		fhandle >> header[3]; //quiz2
		fhandle >> header[4]; //midterm
		fhandle >> header[5]; //final
	}

	public:
		string inFileName, outFileName;
		int numberOfRecords;
		
	StudentFile(string iFileName, string oFileName) : inFileName(iFileName), outFileName(oFileName) {
		int counter = 0;
		numberOfRecords = getLineCount(inFileName);
		records = new StudentRecord[numberOfRecords];
	};

	StudentFile() : inFileName(""), outFileName("") { };

	void readRecords() {
		int counter = 0;
		instream.open(inFileName.c_str());
		assert(! instream.fail() );

		outstream.open(outFileName.c_str(), ios::app);
		assert(! outstream.fail() );

		readHeaderLn(instream);
		while(! instream.eof() ){
			handleLine(instream, counter++);
		}

		instream.close();
		outstream.close();
	}

	void getRecords() {
		int counter = 0;

		prompt(&numberOfRecords, "How many records are you going to be figuring?");
		records = new StudentRecord[numberOfRecords];

		outstream.open(outFileName.c_str(), ios::app);
		assert(! outstream.fail() );

		while( counter <= numberOfRecords ) {
			handleLine(cin, counter++);
		}

		outstream.close();
	}

	void setInFileName (string ifName) {
		this->inFileName = ifName;	
	}
	string getInFileName () { return this->inFileName; } 
	void setOutFileName (string ofName) {
		this->outFileName = ofName;	
	}
	string getOutFileName () { return this->outFileName; } 

};

void main() {

	string inFileName, outFileName;
	char inType;

	do {
		string menu = "Input type...\n" \
					  "...[f]ile\n" \
					  "...[s]tdin\n";
		prompt(&inType, menu);

		StudentFile files;

		if (toupper(inType) == 'F') {
			prompt(&inFileName, "InFile?");
			files.setInFileName(inFileName);

			prompt(&outFileName, "Name of output file?");
			files.setOutFileName(outFileName);

			files.readRecords();

		} else if (toupper(inType) == 'S') {
			prompt(&outFileName, "Name of output file?");
			files.setOutFileName(outFileName);
			files.getRecords();
		}

	} while ( shouldIContinue() );

	StudentFile file(inFileName, outFileName);
}
