
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Saturday 2006-05-27 12:32:12
*	Project	#8	BlackJack3	(P.400)
*
****************************/


#define BLACKJACK
#include <iostream>
#include <string>
#include <StandardFunctions.h>
#include <Console.h>
#include <DeckOCards.h>
using namespace std;

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
