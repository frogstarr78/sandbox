
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Sunday 2006-05-07 11:11:05
*	Project	#9	StudentGradeIO	(P.265)
*
****************************/


#include <fstream>
#include <iostream>
#include <string>
#include <map>
#include <cstdlib>
#include <cctype>
#include <cassert>
#include <StandardFunctions.h>

using namespace std;

struct Course {
	string name;
	int ahundredPercent;
};

class Grade {
	string assignmentName;
	float possible, score;
public:
	float calcGrade() {
		return score/possible;
	}
};

class Student {
	string lastName;
	string firstName;
	Grade grades[10];
	Course course;
	double average;
	double gpa;
};

typedef Student Header;
typedef Student* StudentPtr;

void readLn(ifstream&, Student&);
void writeLn(ofstream&, Student);
void readHeaderLn (ifstream&, Header&, Course);
int getLineCount(char[11]);

class StudentFile {
	StudentRecord records[0];
	ifstream infile;
	ofstream outfile;
	Header headers;
	Course course;
	string inFileName;
	string outFileName;

	void reader(istream& stream){
		cout << "reading data";
		infile.open(infileName);
		assert(!infile.fail());

		string grade;
		int count=0;
		while (!infile.eof()) {
			cout << ".";

			students[count].course = course;

			readLn(stream, students[count]);
//			writer(outfile, students[count]);
			count ++;
		}
		while(!stream.eof()){
			
			i++;
		}
		infile.close();
	}
	void writer(ostream& stream){
		outfile.open(outfileName, ios::app);
		outfile.close();
	}

	void readLn (ifstream& fhandle, Student& student) {
		int score;
		double sum=0.0;

		fhandle >> student.lastName;
		fhandle >> student.firstName;

		for (int i=0; i<10; i++) {
			fhandle >> score;
			sum += score;
			student.grades[i].score = score;
		}
		student.average = sum/10.0;
	//	student.gpa = sum/student.course.ahundredPercent;
	}

	void writeLn (ofstream& fhandle, Student student) {
		fhandle.setf(ios::fixed);
		int score, ahundredPercent=0;

		if (student.lastName != "") {
			fhandle << student.lastName << " ";
			fhandle << student.firstName << " ";

			for (int i=0; i<10; i++) {
				fhandle << student.grades[i].score << " ";
			}
			fhandle.setf(ios::showpoint);
			fhandle.precision(2);
			fhandle << student.average << " ";
	//		fhandle << student.gpa << " ";
			fhandle.unsetf(ios::showpoint);
			fhandle.precision(0);
			fhandle << "\n";
		}
	}

	void readHeaderLn (ifstream& fhandle, Header& header, Course course) {
		string assignmentAndPossible, assignmentName;

		fhandle >> header.lastName;
		fhandle >> header.firstName;

		for (int i=0; i<10; i++) {
			fhandle >> assignmentAndPossible;
			int seperator = assignmentAndPossible.find("/");

			header.grades[i].assignmentName = assignmentAndPossible.substr(0, seperator);
			header.grades[i].possible = atoi(assignmentAndPossible.substr(seperator+1, 3).c_str());
		}
	}

	int getLineCount(char infileName[11]) {
		int count = 0;
		string garbage;
		ifstream infile;

		infile.open(infileName);

		while (!infile.eof()) {
			getline(infile, garbage);
			count++;
		}

		infile.close();
		return count;
	}
public:
	StudentFile(string inFileName, string outFileName) {
		instream.open(inFileName.c_str());
		assert(!instream.fail());
		outstream.open(outFileName.c_str(), ios::app);
		assert(!outstream.fail());


		course.name = "Intro To Computer Science";
		course.ahundredPercent = 0;


		cout << "reading header\n";
		readHeaderLn(instream, headers, course);
		reader(instream);

		delete [] students;
	}
	StudentFile() {};

};


void main() {

}
