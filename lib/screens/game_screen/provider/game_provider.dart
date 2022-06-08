import 'dart:developer' as developer;
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/playing_card.dart';
import '../../../models/player.dart';

///Holds the State of the BlackJack game and cointains the game logic
class GameProvider extends ChangeNotifier {
  ///Identifies who is currently drawing cards, the Dealer or the Player

  Player player = Player(name: "Player");
  Player dealer = Player(name: "Dealer");
  late Player currentPlayer;
  bool gameActive = true;
  GameResult? gameResult;

  GameProvider() {
    currentPlayer = player;
    initialDeal();
  }

  ///Returns the winner of the game or an empty String if no winner has been found yet
  String get winnner {
    switch (gameResult) {
      case GameResult.dealerWin:
        return "Dealer";
      case GameResult.playerWin:
        return "Player";
      case GameResult.tie:
        return "Tie";
      default:
        return "";
    }
  }

  ///Sets up a new round and deals the initial four cards, two for the player and two for the dealer
  void initialDeal() {
    player.cards.add(PlayingCard.random());
    player.calculateScore();

    dealer.cards.add(PlayingCard.random());
    dealer.calculateScore();

    player.cards.add(PlayingCard.random());
    player.calculateScore();

    dealer.cards.add(PlayingCard.random(faceUp: false));
    dealer.calculateScore();

    player.printCards();
    dealer.printCards();
  }

  ///Resets all game variables and starts a new game
  void resetGame() {
    player.cards.clear();
    dealer.cards.clear();

    player.score = 0;
    dealer.score = 0;

    player.hasAce = false;
    dealer.hasAce = false;

    currentPlayer = player;
    gameResult = null;

    initialDeal();
    gameActive = true;

    notifyListeners();
  }

  ///Adds a new card to [Player.cards] of [currentPlayer] and calls [Player.calculateScore]
  void dealCard() {
    PlayingCard randomCard = PlayingCard.random();
    currentPlayer.cards.add(randomCard);
    developer.log("$currentPlayer draws ${randomCard.toString()}",
        name: "dealCards");
    currentPlayer.calculateScore();

    checkWin();
    notifyListeners();
  }

  ///Contains the game logic when the dealer is drwaing cards
  void dealerPlay() {
    while (dealer.score < 17) {
      dealCard();
      checkWin();
    }
    checkWin();
  }

  ///Ends the players turn and switches to the dealer
  void stand() {
    currentPlayer = dealer;
    dealerPlay();
  }

  ///Calcualte if the game has been won or lost after every draw
  void checkWin() {
    //Ways the game can end when the player is drawing
    if (currentPlayer == player) {
      //Player Bust
      if (player.score > 21) {
        gameResult = GameResult.dealerWin;
        gameActive = false;
        developer.log("Player busts", name: "checkWin");
      }
      //Ways the game can end when the dealer is drawing
    } else {
      //Dealer Bust
      if (dealer.score > 21) {
        gameResult = GameResult.dealerWin;
        gameActive = false;
        developer.log("Dealer busts", name: "checkWin");

        //Dealer has higher score than player
      } else if (dealer.score > player.score) {
        gameResult = GameResult.dealerWin;
        gameActive = false;
        developer.log("Dealer has higher score", name: "checkWin");

        //Player has higher score than dealer
      } else if (player.score > dealer.score) {
        gameResult = GameResult.playerWin;
        gameActive = false;
        developer.log("Player has higher score", name: "checkWin");

        //Tie
      } else if (player.score == dealer.score) {
        gameResult = GameResult.tie;
        gameActive = false;
        developer.log("Both player have the same score", name: "checkWin");
      }
    }

    if (!gameActive) {
      developer.log("$winnner wins", name: "checkWin");
    }
    notifyListeners();
  }
}

enum GameResult {
  playerWin,
  dealerWin,
  tie,
}
