class card {
  String m_name;
  String m_suit;
  int m_value;

  card(this.m_name, this.m_suit, this.m_value);

  printcard() {
    if (m_name != "Ace")
      print("$m_name of $m_suit" + "s with a value of $m_value");
    else
      print("$m_name of $m_suit" + "s with a value of $m_value or 11");
  }
}

class deck extends card {
  List<card> mydeck = [];
  int position = 0;

  //create the deck and shuffle
  deck() : super('', '', null) {
    String temp_suit;
    String temp_name;
    int temp_value;

    for (int j = 0; j < 4; j++) {
      if (j == 0) temp_suit = "Spade";
      if (j == 1) temp_suit = "Heart";
      if (j == 2) temp_suit = "Club";
      if (j == 3) temp_suit = "Diamond";

      for (int i = 1; i < 14; i++) {
        if (i == 1) {
          temp_name = "Ace";
          temp_value = 1;
        } else if (i == 11) {
          temp_name = "Jack";
          temp_value = 10;
        } else if (i == 12) {
          temp_name = "Queen";
          temp_value = 10;
        } else if (i == 13) {
          temp_name = "King";
          temp_value = 10;
        } else {
          temp_name = i.toString();
          temp_value = i;
        }
        mydeck.add(card(temp_name, temp_suit, temp_value));
      }
    }
    assert(mydeck.length == 52);
    mydeck.shuffle();
    mydeck.shuffle(); //extra shuffle for "more" randomness
  }

  Draw() {
    if (position < 52) {
      mydeck[position].printcard();
      position++;
    } else
      print("out of cards");
  }

  Shuffle() {
    position = 0;
    mydeck.shuffle();
  }

  //Skip forward one card
  Burn() {
    position++;
  }
}

void main() {
  deck test = deck();
  for (int i = 0; i < 52; i++) {
    test.Draw();
  }
  test.Draw(); //should print "out of cards"
}
