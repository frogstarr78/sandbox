#ifndef DECKoCARDS_H
#define DECKoCARDS_H

struct Cards {
	char suit, value;

	void setSuit(char suit) { this->suit = suit; }
	void setValue(char value) { this->value = value; }

	bool operator ==(const Cards& card) {
		return (this->suit == card.suit && this->value == card.value);
	}

	bool operator < (const Cards& card) {

		if ( card.value == '0' &&
				 ( this->value == 'a' ||
				   this->value == 'k' ||
				   this->value == 'q' ||
				   this->value == 'j' ||
				   this->value == '0' ) ) {
			return false;
		} else if ( card.value == '0' &&
					( this->value == '9' ||
					  this->value == '8' ||
					  this->value == '7' ||
					  this->value == '6' ||
					  this->value == '5' ||
					  this->value == '4' ||
					  this->value == '3' ||
					  this->value == '2' ) ) {
			return true;
		}
	
		if ( this->value == '0' &&
				 ( card.value == 'a' ||
				   card.value == 'k' ||
				   card.value == 'q' ||
				   card.value == 'j' ) ) {
			return true;
		} else if ( this->value == '0' &&
					( card.value == '0' ||
					  card.value == '9' ||
					  card.value == '8' ||
					  card.value == '7' ||
					  card.value == '6' ||
					  card.value == '5' ||
					  card.value == '4' ||
					  card.value == '3' ||
					  card.value == '2' ) ) {
			return false;
		} else if ( this->value == 'j' && 
				    ( card.value == 'a' ||
				      card.value == 'k' ||
				      card.value == 'q' ) ) {
			return true;
		} else if ( this->value == 'q' &&
				    ( card.value == 'a' ||
				      card.value == 'k' ) ) {
			return true;
		} else if ( this->value == 'k' && 
					card.value == 'a' ) {
			return true;
		} else if ( this->value == '9' || 
					this->value == '8' ||
					this->value == '7' ||
					this->value == '6' ||
					this->value == '5' ||
					this->value == '4' ||
					this->value == '3' ||
					this->value == '2' ) {
			return (this->value < card.value);
		} else {
			return false;
		}
	}
};

struct Deck {
	typedef Cards* cardsPtr;
	cardsPtr cards;
	cardsPtr disposedCards;

	const static int cardNumberCount = 13;
	const static char HEART = '\x03';
	const static char DIAMOND = '\x04';
	const static char CLUB = '\x05';
	const static char SPADE = '\x06';

	char suits[4];
	char values[cardNumberCount];
	int COUNT;

	Deck(int numberOfDecks=1) {
		srand( time(NULL) );
		COUNT = numberOfDecks*52;
		cards = new Cards[COUNT];
		disposedCards = new Cards[COUNT];

		suits[0] = HEART;
		suits[1] = CLUB;
		suits[2] = DIAMOND;
		suits[3] = SPADE;

		values[0] = '2';
		values[1] = '3';
		values[2] = '4';
		values[3] = '5';
		values[4] = '6';
		values[5] = '7';
		values[6] = '8';
		values[7] = '9';
		values[8] = '0';
		values[9] = 'j';
		values[10] = 'q';
		values[11] = 'k';
		values[12] = 'a';

		int i=0;
		for(int j=0; j<4; j++) {
			for(int k=0; k<cardNumberCount; k++) {
				cards[i].suit = suits[j];
				cards[i].value = values[k];

				disposedCards[i].suit = '\0';
				disposedCards[i].value = -1;
				i++;
			}
		}
	}

	bool hasUsed(int cardInt) {
		if (disposedCards[cardInt].suit == '\0' && disposedCards[cardInt].value == -1) {
			disposedCards[cardInt].suit = cards[cardInt].suit;
			disposedCards[cardInt].value = cards[cardInt].value;
			return false;
		} else {
			return true;
		}
	}

	private:
};

struct Hand {
	typedef bool* BoolPtr;
	const static int COUNT = 5;
	const static int cardNumberCount = 13;
	const static int handValueCount = 9;
	BoolPtr isPair, isTre, isTwoPair, isFour, isFullHouse, isFlush, isStraight, isStraightFlush, isNothing;
	BoolPtr handValue[handValueCount];
	Cards cards[COUNT];
	int valueCounts[cardNumberCount];
	int score;

	Hand() {
		cardsInHand = 0;
		isNothing=new bool(true);
		isPair=new bool(false);
		isTre=new bool(false);
		isTwoPair=new bool(false);
		isFour=new bool(false);
		isFullHouse=new bool(false);
		isFlush=new bool(false);
		isStraight=new bool(false);
		isStraightFlush=new bool(false);

		handValue[0] = isNothing;
		handValue[1] = isPair;
		handValue[2] = isTwoPair;
		handValue[3] = isTre;
		handValue[4] = isStraight;
		handValue[5] = isFlush;
		handValue[6] = isFullHouse;
		handValue[7] = isFour;
		handValue[8] = isStraightFlush;

		valueCounts[0] = 0;
		valueCounts[1] = 0;
		valueCounts[2] = 0;
		valueCounts[3] = 0;
		valueCounts[4] = 0;
		valueCounts[5] = 0;
		valueCounts[6] = 0;
		valueCounts[7] = 0;
		valueCounts[8] = 0;
		valueCounts[9] = 0;
		valueCounts[10] = 0;
		valueCounts[11] = 0;
		valueCounts[12] = 0;

		score = 0;
	};

	void append(Cards& card) {
		cards[cardsInHand] = card;
		cardsInHand++;

		for(int i=0; i<cardNumberCount; i++) {
			if (card.value == referenceDeck.cards[i].value)
				valueCounts[i]+=1;
		}
	}

	void setValue(BoolPtr param, bool value=true) {
		*param = value;
		if (value == true)
			*isNothing = (!value);
	}

	void checkPairs () {
		int pairs = 0;
		for(int i=0; i<cardNumberCount; i++){
			if (valueCounts[i] == 4) {
				setValue(isFour);
			}
			if (valueCounts[i] == 3) {
				setValue(isTre);
			}
			if (valueCounts[i] == 2) {
				setValue(isPair);
				pairs++;
			}
		}
		if (*isPair == true && 
			*isTre == true) {
			setValue(isFullHouse);
		}

		if (pairs > 1) {
			setValue(isTwoPair);
		}
	}

	void checkStraight () {
		sort(cards, cards+COUNT);

		int j=0;
		for (; j<cardNumberCount; j++) {
			if ( cards[0].value == referenceDeck.cards[j].value ) {
				break;
			}
		}

		for(int i=0; i<COUNT; i++) {
			if ( cards[i].value != referenceDeck.cards[j].value) {
				setValue(isStraight, false);
				return; // can't have this continue and set the value to true
			}
			j++;
		}
		setValue(isStraight);
	}

	void checkFlush () {
		sort(cards, cards+COUNT);

		char initSuit = cards[0].suit;
		for(int i=0; i<COUNT; i++) {
			if ( initSuit != cards[i].suit ) {
				setValue(isFlush, false);
				return; // can't have this continue and set the value to true
			}
		}
		setValue(isFlush);
	}

	void checkStraightFlush () {
		checkStraight();
		checkFlush();

		if ( *isStraight && *isFlush )
			setValue(isStraightFlush);
		else
			setValue(isStraightFlush, false);
	}

	void calcScore() {
		checkPairs();
		checkStraightFlush();

		for(int i=0; i<handValueCount; i++){
			if (*handValue[i] == true)
				this->score = i;
		}
	}

	protected:
		int cardsInHand;
		Deck referenceDeck;
};

#endif
