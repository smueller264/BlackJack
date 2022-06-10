import 'package:flutter/material.dart';

import 'package:playing_cards/playing_cards.dart';

class CardStyle {
  static PlayingCardViewStyle style = PlayingCardViewStyle(suitStyles: {
    Suit.spades:
        SuitStyle(style: const TextStyle(fontSize: 1000, color: Colors.black)),
    Suit.clubs: SuitStyle(style: const TextStyle(fontSize: 500)),
    Suit.diamonds: SuitStyle(style: const TextStyle(fontSize: 500)),
    Suit.hearts:
        SuitStyle(style: const TextStyle(fontSize: 500, color: Colors.black)),
  });

  static ShapeBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: Colors.black, width: 1));
}
