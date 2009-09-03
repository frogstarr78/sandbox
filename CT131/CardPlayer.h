#ifndef CARDPLAYER_H
#define CARDPLAYER_H

#include <DeckOCards.h>
using namespace noelhemming;

namespace cardplayer {

	class Player {
		noelhemming::Hand hand;
		string name;

		Player(): name("") {};
		void setName(string name) { this->name = name; }
		string getName() { return this->name; }
		void showHand() {
			namespace con = JadedHoboConsole;
			sort(hand.cards, hand.cards+hand.COUNT);
			cout << name << " has: " << endl;

			for (int i=0; i<hand.COUNT; i++){
				cout << con::fg_red << hand.cards[i].suit << hand.cards[i].value << " ";
			}
			cout << con::fg_white << " for ";
			switch (hand.score()) {
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
					cout << "a Straight Flush";
					break;
			}
			cout << endl;
		}

		int getHighCard () {
			int highCard = hand.cards[0].value;	
			for (int i=1; i<hand.COUNT; i++ ) {
				if ( hand.cards[i].value > highCard )
					highCard = hand.cards[i].value;
			}
			return highCard;
		}

	};

}

#endif
