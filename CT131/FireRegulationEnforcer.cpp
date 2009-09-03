
/////////////////////////////
//
//	Scott Noel-Hemming
//	CT131
//	Thursday 2006-04-06 02:36:57
//	Project	#6	Fire Regulation Enforcer	(P.95)
//
/////////////////////////////


#include <iostream>
#include <map>
#include <string>
using namespace std;

typedef map<string, int> stringIntMap;

int main() {

	int count, i, numberOfPeople, roomMaxCapacity;
	char shouldIContinue;

	string meetingDateTime;
	stringIntMap::iterator scheduleIterator;
	stringIntMap schedule;

	shouldIContinue = 'y';
	count = 1;

	while ( shouldIContinue == 'Y' || shouldIContinue == 'y') {
		cout << "Enter the date, the meeting is to take place,\n";
		cout << "formatted as [YYYY-MM-DD]: ";
		cin >> meetingDateTime;
		cout << endl;

		cout << "Enter total number of people attending the meeting: ";
		cin >> numberOfPeople;
		cout << endl;

		cout << "Enter the maximum number of people allowable in the meeting room: ";
		cin >> roomMaxCapacity;
		cout << endl;

			cout << "Your meeting planned for room 112, on " << meetingDateTime << endl; 
			cout << "Currently has " << numberOfPeople << " scheduled to attend.\n";

		if ( numberOfPeople > roomMaxCapacity ) {
			cout << "Unfortunately, this amount of people\n";
			cout << "would violate fire regulations for the\n";
			cout << "maximum occupancy.\n";
			cout << "Please choose another room,\n";
			cout << "or reschedule " << (numberOfPeople - roomMaxCapacity) << " people\n";
			cout << "for another time or location.\n\n";
		} else {
			schedule[meetingDateTime] = numberOfPeople;
			cout << "Legally, you are allowed to add an additional\n";
			cout << (roomMaxCapacity - numberOfPeople) << " people to this meeting";

			if ( roomMaxCapacity > 99 ){
				cout << "...\n\n\n";
				cout << "...but don't forget to consider how close they'd have to be\n";
				cout << "to one another to all fit in that little room.\n";
			} else {
				cout << ".\n";
			}
		}

		cout << "\n\n";

		cout << "/=========================\\\n";
		cout << "| Current schedule.       |\n";
		for (scheduleIterator = schedule.begin(); scheduleIterator != schedule.end(); scheduleIterator++) {
		cout << "|-------------------------|\n";
		cout << "|                         |\n";
			cout << "| Date:        ";
			cout.width(10);
			cout << (*scheduleIterator).first;
			cout << " |\n";

			cout << "| # of people: ";
			cout.width(10);
			cout << (*scheduleIterator).second;
			cout << " |\n";
		cout << "|                         |\n";
		}
		cout << "\\\=========================/\n";

		cout << "\n\n";
		cout << "Continue planning? (Y|n): ";
		cin >> shouldIContinue;
	}

	cout << "\n\n";
	cout << "Hope everything goes well!\n";
	0;
}
