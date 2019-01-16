class card {
  String m_name;
  String m_suit;

  card(String Name, String Suit) {
    this.m_name = Name;
    this.m_suit = Suit;
  }

  printcard() {
    print("$m_name of $m_suit" + "s");
  }
}

class deck extends card {
  List<card> mydeck = [];

  deck() : super('', '') {
    Shuffle();
  }

  Draw() {
    if (mydeck.isNotEmpty)
      mydeck.removeLast().printcard();
    else
      print("out of cards");
  }

  Shuffle() {
    mydeck.clear();
    String temp_suit;
    String temp_name;
    for (int j = 0; j < 4; j++) {
      if (j == 0) temp_suit = "Spade";
      if (j == 1) temp_suit = "Queen";
      if (j == 2) temp_suit = "Club";
      if (j == 3) temp_suit = "Diamond";

      for (int i = 1; i < 14; i++) {
        if (i == 1)
          temp_name = "Ace";
        else if (i == 11)
          temp_name = "Jack";
        else if (i == 12)
          temp_name = "Queen";
        else if (i == 13)
          temp_name = "King";
        else
          temp_name = i.toString();
        mydeck.add(card(temp_name, temp_suit));
      }
    }
    assert(mydeck.length == 52);
    mydeck.shuffle();
    mydeck.shuffle();
  }
}

void main() {
  deck test = deck();
  for (int i = 0; i < 52; i++) {
    test.Draw();
  }
  test.Draw(); //should print "out of cards"
}
