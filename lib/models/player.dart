import 'dart:convert';
import 'dart:developer' as developer;

import 'playing_card.dart';

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
    if (cards.any((card) => card.type == Type.ace)) hasAce = true;
    for (var card in cards) {
      score = score + card.type.value;
    }

    if (hasAce && score <= 11) {
      score = score + 10;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "score": score,
      "hasAce": hasAce,
      "name": name,
      "cards": cards,
    };
  }

  ///Prints out [cards]
  void printCards() {
    for (var card in cards) {
      developer.log(card.toString(), name: "$name cards");
    }
  }

  @override
  String toString() {
    return name;
  }
}
