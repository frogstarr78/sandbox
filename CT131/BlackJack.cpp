
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Saturday 2006-05-27 12:32:12
*	Project	#8	BlackJack	(P.400)
*
****************************/


#include <iostream>
#include <map>
#include <exception>
#include <string>
#include <StandardFunctions.h>
#include <stdlib.h>
using namespace std;

typedef map<char, int> Cards;
void init(Cards&, int&, int&);

struct Deck {

	Cards cards;

	Deck(){
		cards['2'] = 2;
		cards['3'] = 3;
		cards['4'] = 4;
		cards['5'] = 5;
		cards['6'] = 6;
		cards['7'] = 7;
		cards['8'] = 8;
		cards['9'] = 9;
		cards['1'] = 10;
		cards['j'] = 10;
		cards['q'] = 10;
		cards['k'] = 10;
		cards['a'] = 11;

		disposedCards['2'] = 0;
		disposedCards['3'] = 0;
		disposedCards['4'] = 0;
		disposedCards['5'] = 0;
		disposedCards['6'] = 0;
		disposedCards['7'] = 0;
		disposedCards['8'] = 0;
		disposedCards['9'] = 0;
		disposedCards['1'] = 0;
		disposedCards['j'] = 0;
		disposedCards['q'] = 0;
		disposedCards['k'] = 0;
		disposedCards['a'] = 0;
	};

	int useCard(char card){
		if (disposedCards[card] < 4) {
			disposedCards[card]++;
		} else {
			return -1;
		}
		return cards[card];
	}

	private:
		Cards disposedCards;
};

int main() {

	int numberOfCards, counter, cardValue, runningTotal;
	char card;

	do {
		Deck deck;

		counter=runningTotal=0;
		prompt(&numberOfCards, "How many cards do you have?");

		if (numberOfCards > 2 || numberOfCards < 6) {
			while ( counter < numberOfCards ) {
				cardValue=0;
				prompt(&card, "Card *(use 1 for 10):");
				cardValue = deck.useCard(card);

				if (cardValue == -1) {
					cout << "YOU LOOSE! YOU'VE BEEN BUSTED FOR CHEATING!" << endl;
					cout << "You've used more " << card << "'s than are in a single" << endl;
					cout << "deck of cards. You have to go directly to jail." << endl;
					cout << "Do not pass go. Do not collect $200." << endl;
					exit(0);

				} else if (cardValue == 11) {
					cout << "here" << cardValue << endl;
					if (cardValue + runningTotal > 21) {
						runningTotal += 1;
					} else {
						runningTotal += cardValue;
					}
				} else {
						runningTotal += cardValue;
				}
				
				if (runningTotal > 21){
					cout << "Busted" << endl;
					break;
				} else {
					cout << runningTotal << endl;	
				}
				counter++;
			}
		} else {
			cout << "Please enter a number between 2 and 5." << endl;	
		}
	
	} while ( shouldIContinue() );
}
