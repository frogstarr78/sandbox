
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Sunday 2006-05-28 16:17:05
*	Project	#9	PokerHand	(P.563)
*
*	See below url for some issues regarding issues with the Cards::< operator;
*	http://forums.microsoft.com/msdn/ShowPost.aspx?postid=449258&SiteID=1
*
****************************/

#include <iostream>
#include <fstream>
#include <algorithm>
#include <string>
#include <Console.h>
#include <stdlib.h>
#include <time.h>
#include <StandardFunctions.h>
#include <DeckOCards.h>
#include <cassert>
#include <map>
using noelhemming::prompt;
using noelhemming::alertn;
using noelhemming::shouldIContinue;
using noelhemming::showArrayElement;
using noelhemming::compareVariables;
using namespace std;

struct Player {
	Hand hand;
	string name;
	int purse;

	Player(): name("") {};
	void setName(string lname, string fname) { this->name = fname + " " + lname; }
	string getName() { return this->name; }

	void showHand() {
		namespace con = JadedHoboConsole;
		sort(hand.cards, hand.cards+hand.COUNT);

		hand.calcScore();

		cout << endl;
		cout << name << " has: ";

		for (int i=0; i<hand.COUNT; i++){
			cout << con::fg_red << hand.cards[i].suit;

			if (hand.cards[i].value == '0')
				cout << "10";
			else
				cout << hand.cards[i].value;
			cout << " " << con::fg_white;
		}
		cout << con::fg_yellow;

		switch (hand.score) {
			case 0:
				cout << "Nothing";
				break;
			case 1:
				cout << "a Pair";
				break;
			case 2:
				cout << "Two Pair";
				break;
			case 3:
				cout << "Three of a kind";
				break;
			case 4:
				cout << "a Straight";
				break;
			case 5:
				cout << "a Flush";
				break;
			case 6:
				cout << "a Full House";
				break;
			case 7:
				cout << "Four of a kind";
				break;
			case 8:
				if ( hand.cards[0].value == '0' )
					cout << "a Royal Flush";
				else
					cout << "a Straight Flush";
				break;
		}
		cout << con::fg_white << endl;
	}

	int getHighCard () {
		int highCard = hand.cards[0].value;	
		int highCardCount = 0;	

		switch (hand.score) {
			case 1: // pair
			case 2: // twopair
			case 3: // three
			case 6: // full
			case 7: // four
				for (int i=1; i<hand.cardNumberCount; i++ ) {
					if ( hand.valueCounts[i] > 1 && i > highCardCount )
						highCardCount = i;
				}
				return highCardCount;
			default:
				for (int i=1; i<hand.COUNT; i++ ) {
					if ( hand.cards[i].value > highCard )
						highCard = hand.cards[i].value;
				}
				return highCard;
		}
	}

	void deal(Player& player, Deck& deck) {
		namespace con = JadedHoboConsole;
		int cardInt;

		cardInt = rand()%52;
		while (deck.hasUsed(cardInt)) {
			 cardInt = rand()%52;
		}

		player.hand.append(deck.cards[cardInt]);

		cout << "dealing "  << player.getName() << " a " 
			 << con::fg_red << deck.cards[cardInt].suit;
		if (deck.cards[cardInt].value == '0')
			cout << "10";
		else
			cout << deck.cards[cardInt].value;
		cout << con::fg_white << endl;
	}

	void deal(Player& player, Deck& deck, int cardInt) {
		namespace con = JadedHoboConsole;
		
		player.hand.append(deck.cards[cardInt]);

		cout << "dealing "  << player.getName() << " a " 
			 << con::fg_red << deck.cards[cardInt].suit;
		if (deck.cards[cardInt].value == '0')
			cout << "10";
		else
			cout << deck.cards[cardInt].value;
		cout << con::fg_white << endl;
	}

};

struct Options {
	bool readFile, DBUG;
	string inputFile;
	ifstream ifile;
	string outputFile;
	ofstream ofile;
	int count;

	Options() : readFile(0), DBUG(0), count(0), inputFile(""), outputFile("") {};
};

struct Game {
	typedef Player* PlayerPtr;
	PlayerPtr players;
	Options options;

	void getNumberOfPlayers(Options&);
	void getPlayers(Options&);
	void deal();
	Game(Options&);

};

void announceWinner(Player);
void handleCommandLineArgs(int, char *[], Options&);
void usage(string);
void getNumberOfPlayers(Options&);
void getPlayers(Options&);
void dealTable(Deck&, Options&);
void callTable(int);
int calculateWinner(int, Player[]);

typedef int* ScoreChartPtr;
ScoreChartPtr scoreChart;
typedef Player* PlayerPtr;
PlayerPtr players;


void main(int argc, char *argv[]) {

	Options options;
	int dealerInt = 0;

	handleCommandLineArgs(argc, argv, options);

	getNumberOfPlayers(options);
	scoreChart = new int[options.count];
	players = new Player[options.count];
	getPlayers(options);

/*

//		for (scoreChartIterator = scoreChart.begin(); scoreChartIterator != scoreChart.end(); scoreChartIterator++) {
//			cout << (*scoreChartIterator).first;
//			cout << (*scoreChartIterator).second;
//		}

	do {
		Deck decks((options.count%5 || 1));

		dealTable(++dealerInt, decks, options);

		callTable(options.count);		

		if ( player.hand.score > house.hand.score ) {
			announceWinner(player);
		} else if ( player.hand.score < house.hand.score ) {
			announceWinner(house);
		} else {						// hand's score is equal
		
			if ( player.hand.score != 0 ) {
				// they're equal here, so, no need to check both scores

				if ( player.getHighCard() > house.getHighCard() ) {
					announceWinner(player);
				} else if ( player.getHighCard() < house.getHighCard() ) {
					announceWinner(house);
				} else {
					cout << "Push" << endl;
				}
			} else {
				if (player.getHighCard() != house.getHighCard()) {
					cout << " Everyone bluffed and " 
						 << ((player.getHighCard() > house.getHighCard()) ? player.getName() : house.getName()) 
						 << " had the highest card." 
						 << endl;
				}
			}
		}

	} while ( shouldIContinue() );*/
}

Game::Game(Options& options) {
	this->getNumberOfPlayers(options);
	players = new Player[this->options.count];

	this->getPlayers(options);
}

void getNumberOfPlayers(Options& options) {
	if (options.readFile) {
		string next;
		ifstream ifile;
		ifile.open(options.inputFile.c_str());	
		assert(!ifile.fail());
		while( !ifile.eof() ) {
			getline(ifile, next);
			cout << next << endl;
			if (next != "") 
				options.count++;
		}
		ifile.close();
	} else {
		prompt(options.count, "How many players are there (up to 10):");
	}
		if ( options.count > 10 )
			options.count = 10;
}

void getPlayers(Options& options) {
	string lname, fname;
	if (options.readFile) {
		
		ifstream ifile;
		ifile.open(options.inputFile.c_str());

		assert(!ifile.fail());
		for(int i=0; i<options.count; i++) {
			Hand newHand;

			ifile >> lname >> fname >> players[i].purse;
			if ( lname != "" && fname != "" )
				players[i].setName(lname, fname);
				players[i].hand = newHand;
		}
		ifile.close();
	} else {
		for(int i=0; i<options.count; i++) {
			prompt(lname, "Last name:");
			prompt(fname, "First name:");
			players[i].setName(lname, fname);
		}
	}
}

void dealTable (int dealerInt, Deck& deck, int playerCount, bool dbug=false) {

	int necessaryDeals = playerCount;
	int j=(dealerInt+1 == playerCount) ? 0 : dealerInt+1; // deal to the right

	for (int i=0; i!=5; i++) {							  // deal 5 cards each
		while ( j!=necessaryDeals ) {					  // but only deal one to each as we go around

			players[dealerInt].deal(players[j], deck);    // dealer deals 1 card to each player
			j = (j+1 == playerCount) ? 0 : j+1;			  // start back at 0'th index of players
		}

		if (i > 5) {
			cout << "An error occured during the deal" 
			     << endl;
			exit(1);									  // failsafe
		}
	}													  // loop is controlled by 5 card deal
}

void callTable (int playerCount) {
	for (int i=0; i<playerCount; i++) {
		players[i].showHand();
	}
}

int calculateWinner (int playersCount, Player players[]) {
	int scoreChart[playersCount];

	int j=0;
	for(int i=0; i<playersCount; i++) {
		j=(i+1 < playersCount) ? j+1 : 0;

		if ( players[i].hand.score > players[j].hand.score ) {
			scoreChart[i] = players[i].hand.score;
		} else if ( players[i].hand.score < players[j].hand.score ) {
			scoreChart[j] = players[i].hand.score;
		} else {						// hand's score is equal
		
			if ( player.hand.score != 0 ) {
				// they're equal here, so, no need to check both scores

				if ( player.getHighCard() > house.getHighCard() ) {
					announceWinner(player);
				} else if ( player.getHighCard() < house.getHighCard() ) {
					announceWinner(house);
				} else {
					cout << "Push" << endl;
				}
			} else {
				if (player.getHighCard() != house.getHighCard()) {
					cout << " Everyone bluffed and " 
						 << ((player.getHighCard() > house.getHighCard()) ? player.getName() : house.getName()) 
						 << " had the highest card." 
						 << endl;
				}
			}
		}
	}
}

void handleCommandLineArgs(int argc, char *argv[], Options& options) {
	if (argc == 1) {
		usage(argv[0]);
	}

	int i=1;
	while(i<argc) {
		string currentArg = (string)argv[i];

		if (currentArg == "--"){
			options.readFile = 0;
			i++;
		} else if (currentArg == "-o" || currentArg == "--outputFile") {
			options.outputFile = argv[++i];
			cout << options.outputFile << endl;
		} else if (currentArg == "-i" || currentArg == "--inputFile") {
			options.readFile = 1;
			options.inputFile = argv[++i];
			cout << options.inputFile << endl;
		} else if (currentArg == "-D" || currentArg == "--debug") {
			options.debug = true;	
		} else {
			cout << "Unknown error" << endl;
			usage(argv[0]);
		}
		i++;
	}
}

void usage(string name) {
	namespace con = JadedHoboConsole;
	cout << con::fg_gray << endl;

	cout << "Usage: " + name + " options" << endl;
	cout << "" << endl;
	cout << "" << endl;
	cout << "Options:" << endl;
	cout << "" << endl;
	cout << con::fg_yellow << "-i/--inputFile" << con::fg_gray << " File to store users data." << endl;
	cout << "               Initially reads game participants." << endl;
	cout << "               Also records their purse for" << endl;
	cout << "               non-continuous games." << endl;
	cout << con::fg_yellow << "-o/--outputFile" << con::fg_gray << " File to store users data. If used with the -- argument." << endl;
	cout << "                Otherwise uses inputFile for this value." << endl;
	cout << con::fg_yellow << "--" << con::fg_gray << " Reads users from stdin." << endl;
	exit(0);
}

void announceWinner(Player player) {
	namespace con = JadedHoboConsole;
	cout << con::fg_green << player.getName() << " WINS!" << con::fg_white << endl;
}
