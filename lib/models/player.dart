import 'dart:developer' as developer;

import 'package:playing_cards/playing_cards.dart';
import '../extensions/playing_card_extension.dart';

class Player {
  ///Current Playerscore
  int score = 0;
  bool hasAce = false;
  String name;

  Player({required this.name});

  ///Current List of Playing Cards
  List<PlayingCard> cards = [];

  void calculateScore() {
    score = 0;
    if (cards.any((card) => card.value == CardValue.ace)) hasAce = true;
    for (var card in cards) {
      score = score + card.value.numValue;
    }

    if (hasAce && score <= 11) {
      score = score + 10;
    }
  }

  ///Prints out [cards]
  void printCards() {
    for (var card in cards) {
      developer.log(card.print(), name: "$name cards");
    }
  }

  @override
  String toString() {
    return name;
  }
}
