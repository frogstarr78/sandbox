
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
#include <Console.h>
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

	void writeGrade() {
		namespace con = JadedHoboConsole;

		if (this->getGrade() > 0.9) 
			cout << con::bg_green << con::fg_black << this->getGrade() << con::bg_black << con::fg_gray << endl;
		else if (0.9 > this->getGrade() && this->getGrade() > 0.8) 
			cout << con::bg_black << con::fg_green << this->getGrade() << con::bg_black << con::fg_gray << endl;
		else if (0.8 > this->getGrade() && this->getGrade() > 0.7) 
			cout << con::bg_yellow << con::fg_black << this->getGrade() << con::bg_black << con::fg_gray << endl;
		else if (0.7 > this->getGrade() && this->getGrade() > 0.6) 
			cout << con::bg_black << con::fg_yellow << this->getGrade() << con::bg_black << con::fg_gray << endl;
		else if (0.6 > this->getGrade()) 
			cout << con::bg_red << con::fg_black << this->getGrade() << con::bg_black << con::fg_gray << endl;
		else  
			cout << endl;
	}

};

class Midterm : public Grade {
	public:
		Midterm(float weight, float score=100.0, float grade=0.0) : Grade(weight, score, grade) {};
		Midterm() : Grade(0.25, 100.0) {};

		void writeGrade() {
			namespace con = JadedHoboConsole;

			if (this->getWeightedGrade() > 0.9) 
				cout << con::bg_green << con::fg_white << this->getWeightedGrade() << con::bg_black << con::fg_gray << endl;
			else if (0.9 > this->getWeightedGrade() && this->getWeightedGrade() > 0.8) 
				cout << con::bg_black << con::fg_green << this->getWeightedGrade() << con::bg_black << con::fg_gray << endl;
			else if (0.8 > this->getWeightedGrade() && this->getWeightedGrade() > 0.7) 
				cout << con::bg_yellow << con::fg_black << this->getWeightedGrade() << con::bg_black << con::fg_gray << endl;
			else if (0.7 > this->getWeightedGrade() && this->getWeightedGrade() > 0.6) 
				cout << con::bg_black << con::fg_yellow << this->getWeightedGrade() << con::bg_black << con::fg_gray << endl;
			else if (0.6 > this->getWeightedGrade()) 
				cout << con::bg_red << con::fg_black << this->getWeightedGrade() << con::bg_black << con::fg_gray << endl;
			else  
				cout << endl;
		}
};

class Final : public Midterm {
	public:
		Final() : Midterm(0.50) {};
};

class StudentRecord {
	Grade quiz[2], final, midterm;

	public:

		float grade;
		char letterGrade;
		string lastName, firstName;
		StudentRecord(string lName, string fName, Grade quizGrades[2], Midterm midtermGrade, Final finalGrade) {
			lastName = lName;
			firstName = fName;
			quiz[0] = Grade();
			quiz[1] = Grade();
			midterm = Midterm();
			final = Final();
		};

		StudentRecord() {
			quiz[0] = Grade();
			quiz[1] = Grade();
			midterm = Midterm();
			final = Final();
		};

		void setQuizGrade(float grade, int index) { quiz[index].setGrade(grade);	}
		Grade getQuiz(int index) { return quiz[index]; }

		void setMidtermGrade(float grade) { midterm.setGrade(grade); }
		Grade getMidterm() { return this->midterm; }

		void setFinalGrade(float grade) { final.setGrade(grade); }
		Grade getFinal() { return final; }
		
		void calcGrade () {
			float quizes = ((quiz[0].getGrade() + quiz[1].getGrade()) / 2) * 0.25;
			this->grade = quizes + midterm.getWeightedGrade() + final.getWeightedGrade();
		}

	void writeGrade() {
		namespace con = JadedHoboConsole;

		if (this->grade > 0.9) 
			cout << con::bg_green << con::fg_gray << this->grade << con::bg_black << con::fg_gray << endl;
		else if (0.9 > this->grade && this->grade > 0.8) 
			cout << con::bg_black << con::fg_green << this->grade << con::bg_black << con::fg_gray << endl;
		else if (0.8 > this->grade && this->grade > 0.7) 
			cout << con::bg_yellow << con::fg_black << this->grade << con::bg_black << con::fg_gray << endl;
		else if (0.7 > this->grade && this->grade > 0.6) 
			cout << con::bg_black << con::fg_yellow << this->grade << con::bg_black << con::fg_gray << endl;
		else if (0.6 > this->grade) 
			cout << con::bg_red << con::fg_black << this->grade << con::bg_black << con::fg_gray << endl;
		else  
			cout << endl;
	}

	float getGrade () {
		return grade;
	}

		void figureLetterGrade () {
			if (grade > 0.9)
				letterGrade = 'A';
			else if (0.9 > grade && grade > 0.8)
				letterGrade = 'B';
			else if (0.8 > grade && grade > 0.7)
				letterGrade = 'C';
			else if (0.7 > grade && grade > 0.6)
				letterGrade = 'D';
			else if (0.6 > grade)
				letterGrade = 'F';
			else 
				letterGrade = 'X';
		}

	void writeLetterGrade (){
		namespace con = JadedHoboConsole;
		switch(letterGrade){
			case 'A':
				cout << con::bg_green << con::fg_white << letterGrade << con::bg_black << con::fg_gray << endl;
				break;
			case 'B':
				cout << con::bg_black << con::fg_green << letterGrade << con::bg_black << con::fg_gray << endl;
				break;
			case 'C':
				cout << con::bg_yellow << con::fg_black << letterGrade << con::bg_black << con::fg_gray << endl;
				break;
			case 'D':
				cout << con::bg_black << con::fg_yellow << letterGrade << con::bg_black << con::fg_gray << endl;
				break;
			case 'F':
				cout << con::bg_red << con::fg_black << letterGrade << con::bg_black << con::fg_gray << endl;
				break;
			default:
				cout << endl;
				break;
		}
	}

	char getLetterGrade() {
		return letterGrade;
	}

		void setLastName(string lName) {
			lastName = lName;
		}
		string getLastName () { return lastName; }

		void setFirstName(string fName) {
			firstName = fName;
		}
		string getFirstName () { return firstName; }
};

class StudentFile {
		ifstream instream;
		ofstream outstream;
		StudentRecord record;
		char header[6][20];

		void handleLine (int counter=NULL) {
			float grade;
			string name;

			cout.setf(ios::fixed);
			cout.unsetf(ios::showpoint);

			instream >> name;
			if (name != "") {
				namespace con = JadedHoboConsole;
				cout << con::bg_black;

				record.setLastName(name);
				cout << con::fg_blue << "lastName: " << record.getLastName() << con::bg_black << con::fg_gray << endl;
				outstream << record.getLastName();

				instream >> name;
				record.setFirstName(name);
				cout << con::fg_blue << "firstName: " << record.getFirstName() << con::bg_black << con::fg_gray << endl;
				outstream << record.getFirstName();

				cout.setf(ios::showpoint);
				cout.precision(2);
				outstream.setf(ios::showpoint);
				outstream.precision(2);

				instream >> grade;
				record.setQuizGrade(grade, 0);
				cout << "quiz#1: ";
				record.getQuiz(0).writeGrade();
				outstream << record.getQuiz(0).getGrade();

				instream >> grade;
				record.setQuizGrade(grade, 1);
				cout << "quiz#2: ";
				record.getQuiz(1).writeGrade();
				outstream << record.getQuiz(1).getGrade();

				instream >> grade;
				record.setMidtermGrade(grade);
				cout << "midterm: ";
				record.getMidterm().writeGrade();
				outstream << record.getMidterm().getGrade();

				instream >> grade;
				record.setFinalGrade(grade);
				cout << "final: ";
				record.getFinal().writeGrade();
				outstream << record.getFinal().getGrade();
	
				record.calcGrade();
				cout << "grade / 100: ";
				record.writeGrade();
				outstream << record.getGrade();

				record.figureLetterGrade();
				cout << "letterGrade: ";
				record.writeLetterGrade();
				outstream << record.getLetterGrade();
				outstream << endl;
			}
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
		numberOfRecords = getLineCount(inFileName);
	};

	StudentFile() : inFileName(""), outFileName("") { };

	void readRecords() {
		instream.open(inFileName.c_str());
		assert(! instream.fail() );

		outstream.open(outFileName.c_str(), ios::app);
		assert(! outstream.fail() );

		readHeaderLn(instream);
		while(! instream.eof() ){
			handleLine();
		}

		instream.close();
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
		StudentFile files;

		prompt(&inFileName, "InFile?");
		files.setInFileName(inFileName);

		prompt(&outFileName, "Name of output file?");
		files.setOutFileName(outFileName);

		files.readRecords();

	} while ( shouldIContinue() );

	StudentFile file(inFileName, outFileName);
}
