import 'package:flutter/material.dart';

import '../../models/playing_card.dart';

///Holds the State of the BlackJack game and cointains the game logic
class GameProvider extends ChangeNotifier {
  ///Identifies who is currently drawing cards, the Dealer or the Player
  String currentPlayer = "Player";
  int playerScore = 0;
  int dealerScore = 0;

  List<PlayingCard> playerCards = [];
  List<PlayingCard> dealerCards = [];

  GameProvider() {
    dealCard();
    playerCards.forEach((element) {
      print(element.type);
    });
  }

  void dealCard() {
    for (int i = 0; i < 20; i++) {
      //playerCards.add(PlayingCard.random());
      playerCards.add(PlayingCard.random());
    }
  }
}
