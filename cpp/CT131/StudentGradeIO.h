struct Course {
	string name;
	int ahundredPercent;
};

struct Student {
	string lastName;
	string firstName;
//	Grade grades[10];
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

void __main() {
	ifstream infile;
	ofstream outfile;
	int count=0;
	char next[100];
	char infileName[11] = "infile.ssv"; // for [s]pace [s]eparated [v]alues.
	char outfileName[12] = "outfile.ssv"; // for [s]pace [s]eparated [v]alues.

	StudentPtr students = new Student[getLineCount(infileName)];
	Header headers;
	Course course;

	course.name = "Intro To Computer Science";
	course.ahundredPercent = 0;

	infile.open(infileName);
	outfile.open(outfileName, ios::app);
	assert(!infile.fail());

	readHeaderLn(infile, headers, course);
	cout << "reading header\n";

	cout << "reading data";
	while (!infile.eof()) {
		cout << ".";

		students[count].course = course;

		readLn(infile, students[count]);
		writeLn(outfile, students[count]);
		count ++;
	}

	infile.close();
	outfile.close();
	delete [] students;
}

void readLn (ifstream& fhandle, Student& student) {
	int score;
	double sum=0.0;

	fhandle >> student.lastName;
	fhandle >> student.firstName;

	for (int i=0; i<10; i++) {
		fhandle >> score;
		sum += score;
//		student.grades[i].score = score;
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
//			fhandle << student.grades[i].score << " ";
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

//		header.grades[i].assignmentName = assignmentAndPossible.substr(0, seperator);
//		header.grades[i].possible = atoi(assignmentAndPossible.substr(seperator+1, 3).c_str());
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
