#include <iostream>
using namespace std;

#ifndef DECKoCARDS_H
#define DECKoCARDS_H

#ifndef POKER
#ifndef BLACKJACK
#error No defined game type.
#endif
#endif

#include <iostream>
#include <map>
#include <exception>
#include <string>
#include <StandardFunctions.h>
#include <stdlib.h>
#include <time.h>
#include <Console.h>
using namespace std;

namespace Cards {
struct Cards {
	char suit, value;

	void setSuit(char suit) { this->suit = suit; }
	void setValue(char value) { this->value = value; }

	bool operator ==(const Cards& card) {
		return (this->suit == card.suit && this->value == card.value);
	}
};

	struct Player {

		Cards hand[5];
		string name;

		Player(): name("") {};
		void setName(string name) { this->name = name; }
		string getName() { return this->name; }
		void addCardToHand (int cardValue) { 
			
		}
	};
}

class Deck {

	public: 
		char suits[4];
		char values[12];
/*		bool isPair() {}
		bool isTwoPair () {}
		bool isThreePair () {}
		bool isStraight () {}
		bool isFlush () {}
		bool isFullHouse () {}
		bool isSixPair () {}
		bool isStraightFlush () {
			return (
		}
		string scoreHand(Player& player) {
			switch(player.hand) {
				case .isPair():
					break;
			}
		}	*/

#ifdef BLACKJACK
	typedef map<char, int> Cards;
	Cards cardValues;
	char cards[12];
	private:
		Cards disposedCards;
	
	public: 


		int useCard(int card) {
			
			if (disposedCards[cards[card]] < 4) {
				disposedCards[cards[card]]++;
			} else {
				return -1;
			}
			return cardValues[cards[card]];
		}

		bool dealCard(Player& player) {
			namespace con = JadedHoboConsole;
			
			int card = rand()%12;
			int cardValue = useCard(card);
			
			if (cards[card] == '1')
				cout << player.getName() << " gets a " << con::fg_red << "10" << con::fg_gray << endl;
			else 
				cout << player.getName() << " gets a " << con::fg_red << cards[card] << con::fg_gray << endl;
			
			player.addCardToHand(cardValue);

			if (player.hasBusted == true){
				cout << player.getName() << " Busts" << endl;
				return true;
			} else {
				if ( player.getName() == "Dealer" && player.getHandTotal() >= 17) {
					cout << '\t' << player.getName() << " holds at " << con::fg_green << player.getHandTotal() << con::fg_gray << endl;
				} else {
					cout << '\t' << player.getName() << "'s hand is " << con::fg_green << player.getHandTotal() << con::fg_gray << endl;	
				}
			}
			return false;
		}

		Deck() {
			init();
			srand( time(NULL) );

			cards[0]  = '2';
			cards[1]  = '3';
			cards[2]  = '4';
			cards[3]  = '5';
			cards[4]  = '6';
			cards[5]  = '7';
			cards[6]  = '8';
			cards[7]  = '9';
			cards[8]  = '1';
			cards[9]  = 'j';
			cards[10] = 'q';
			cards[11] = 'k';
			cards[12] = 'a';

			cardValues['2'] = 2;
			cardValues['3'] = 3;
			cardValues['4'] = 4;
			cardValues['5'] = 5;
			cardValues['6'] = 6;
			cardValues['7'] = 7;
			cardValues['8'] = 8;
			cardValues['9'] = 9;
			cardValues['1'] = 10;
			cardValues['j'] = 10;
			cardValues['q'] = 10;
			cardValues['k'] = 10;
			cardValues['a'] = 11;

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

#endif

#ifdef POKER
	private:
		Cards disposedCards[52];
		string handCategory[9];

	public: 
		typedef Cards* CardPtr;
		CardPtr cards;

		int useCard(int card) {
			disposedCards[card] = cards[card];
			return cards[card].value;
		}

		Deck(int decks=1) {
			cards = new Cards[decks*52];
			init();

			srand( time(NULL) );
			//randomizer for card dealing
		};

		bool deal(Player& player, int numberOfCards=5) {
			namespace con = JadedHoboConsole;
			
			int card = rand()%52;
			int cardValue = useCard(card);
			
			return false;
		}
#endif

	public: 

		void Deck::init() {
			using namespace std;
			suits[0] = '\x03';
			suits[1] = '\x04';
			suits[2] = '\x05';
			suits[3] = '\x06';

			values[0]  = '2';
			values[1]  = '3';
			values[2]  = '4';
			values[3]  = '5';
			values[4]  = '6';
			values[5]  = '7';
			values[6]  = '8';
			values[7]  = '9';
			values[8]  = '0';
			values[9]  = 'j';
			values[10] = 'q';
			values[11] = 'k';
			values[12] = 'a';

			int i=0;
			for(int j=0; j<4; j++) {
				for(int k=0; k<13; k++) {
					cards[i].suit = suits[j];
					cards[i].value = values[k];
					i++;
				}
			}
		}

		void cleanUp () {
			delete [] cards;
		}

}; // end Deck class

#endif
