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

  ///Calculates the score of the Player from scratch and decides the value of [Type.ace] either 1 or 11
  void calculateScore() {
    score = 0;
    for (var card in cards) {
      final cardValue = card.type.value;
      if (card.type != Type.ace) {
        score = score + cardValue;
      } else {
        if (score + cardValue <= 21) {
          score = score + cardValue;
          hasAce = true;
        } else {
          score = score * 1;
          hasAce = false;
        }
      }
    }
    developer.log("$name score: $score", name: "calculateScore");
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
