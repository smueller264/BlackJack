///Basic Class representing a playing card
///
///Contains all needed information about a playing card inclung [suit], [rank] and if
///it is a face card the [image]

class PlayingCard {
  late Suit suit;
  late Type type;
  String? image;
  bool faceUp;

  PlayingCard({
    required this.suit,
    required this.type,
    this.image,
    this.faceUp = false,
  });

  ///Returns a random [PlayingCard]
  PlayingCard.random({this.faceUp = false}) {
    List types = (List.from(Type.values))..shuffle();
    type = types.first;

    List suits = (List.from(Suit.values))..shuffle();
    suit = suits.first;
  }

  ///Returns [CardColor.black] or [CardColor.red] depending on the [Suit] of the card
  CardColor get cardColor {
    if (suit == Suit.hearts || suit == Suit.diamonds) {
      return CardColor.red;
    } else {
      return CardColor.black;
    }
  }
}

enum Suit {
  hearts,
  diamonds,
  spades,
  clubs,
}

///Type of the Playing card going from two to ace
enum Type {
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
  ace,
}

///Returns the numeric value of the [Type]
extension ValueExtension on Type {
  int get value {
    switch (this) {
      case Type.two:
        return 2;
      case Type.three:
        return 3;
      case Type.four:
        return 4;
      case Type.five:
        return 5;
      case Type.six:
        return 6;
      case Type.seven:
        return 7;
      case Type.eight:
        return 8;
      case Type.nine:
        return 9;
      case Type.ten:
        return 10;
      case Type.jack:
        return 10;
      case Type.queen:
        return 10;
      case Type.king:
        return 10;
      case Type.ace:
        return 11;
    }
  }
}

enum CardColor { red, black }
