
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Saturday 2006-05-27 12:32:12
*	Project	#8	BlackJack2	(P.400)
*
****************************/


#include <iostream>
#include <map>
#include <exception>
#include <string>
#include <StandardFunctions.h>
#include <stdlib.h>
#include <time.h>
#include <Console.h>
using namespace std;

typedef map<char, int> Cards;
void init(Cards&, int&, int&);

struct Player {
	int hand;
	string name;
	bool hasBusted;
	int numberOfCardsDealt;

	Player(): hand(0), hasBusted(false), numberOfCardsDealt(0), name("") {};
	void setName(string name) { this->name = name; }
	string getName() { return this->name; }
	void addCardToHand (int cardValue) { 
		this->numberOfCardsDealt++;

		if (cardValue == 11) {
			if (cardValue + this->hand > 21)
				this->hand += 1; 
			else
				this->hand += cardValue; 
		} else {
			this->hand += cardValue; 
		}

		if (this->hand > 21)
			this->hasBusted = true;
	}
	int getHandTotal() { return this->hand; }
};

struct Deck {

	Cards cardValues;
	char cards[12];

	Deck(){
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

	int useCard(char card){
		if (disposedCards[card] < 4) {
			disposedCards[card]++;
		} else {
			return -1;
		}
		return cardValues[card];
	}

	int useCard(int card) {
		
		if (disposedCards[cards[card]] < 4) {
			disposedCards[cards[card]]++;
		} else {
			return -1;
		}
		return cardValues[cards[card]];
	}

	bool dealCard(string playerName, int& playerTotal) {
		int card = rand()%12;
		int cardValue = useCard(card);

		cout << "Dealer deals " << cards[card] << " to " << playerName << endl;

		if (cardValue == -1) {
			cout << "YOU LOOSE! YOU'VE BEEN BUSTED FOR CHEATING!" << endl;
			cout << "You've used more " << cards[card] << "'s than are in a single" << endl;
			cout << "deck of cards. You have to go directly to jail." << endl;
			cout << "Do not pass go. Do not collect $200." << endl;
			exit(0);

		} else if (cardValue == 11) {
			if (cardValue + playerTotal > 21) {
				playerTotal += 1;
			} else {
				playerTotal += cardValue;
			}
		} else {
				playerTotal += cardValue;
		}
		
		if (playerTotal > 21){
			cout << playerName << " Busts" << endl;
			return true;
		} else {
			if ( playerName == "Dealer" && playerTotal == 17) {
				cout << '\t' << playerName << " holds at " << playerTotal << endl;
			} else {
				cout << '\t' << playerName << "'s hand is " << playerTotal << endl;	
			}
		}
		return false;
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

	private:
		Cards disposedCards;
};

int main() {
	namespace con = JadedHoboConsole;
	cout << con::fg_gray << endl;

	bool userHasBusted, hitMe = true;
	string name;

	prompt(&name, "Please enter your name:");

	do {
		Deck deck;
		Player dealer;
		Player player;
		player.setName(name);
		dealer.setName("Dealer");

		do {
			deck.dealCard(player);
			if ( dealer.getHandTotal() < 17 ) {
				deck.dealCard(dealer);
			}	

			if (player.hasBusted == true || player.numberOfCardsDealt == 5)
				break;

			if ( player.getHandTotal() == 21)
				break;
			if ( player.getHandTotal() > dealer.getHandTotal() && dealer.getHandTotal() >= 17 )
				break; 

			prompt(&hitMe, "Hit?");

		} while ( hitMe == true );

		if (dealer.hasBusted == false){
			while( dealer.getHandTotal() < 17 ) {
				deck.dealCard(dealer);
			}	
		}

		if (player.hasBusted == false) {
			if (dealer.hasBusted == true) 
				cout << player.getName() << " wins!" << endl;
			else if (player.getHandTotal() > dealer.getHandTotal())
				cout << player.getName() << " wins!" << endl;
			else
				cout << "House wins!" << endl;
		} else {
			cout << "House wins!" << endl;
		}
	
	} while ( shouldIContinue() );
}
