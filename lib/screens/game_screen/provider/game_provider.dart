import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

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
    player.cards.add(createRandomCard());

    dealer.cards.add(createRandomCard());

    player.cards.add(createRandomCard());
    player.calculateScore();

    dealer.cards.add(createRandomCard());
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

  ///Returns a [PlayingCard] with random values
  PlayingCard createRandomCard() {
    List values = (List.from(CardValue.values))
      ..remove(CardValue.joker_1)
      ..remove(CardValue.joker_2)
      ..shuffle();
    final value = values.first;

    List suits = (List.from(Suit.values))
      ..remove(Suit.joker)
      ..shuffle();
    final suit = suits.first;

    final randomCard = PlayingCard(suit, value);

    return randomCard;
  }

  ///Adds a new card to [currentPlayer.cards] and calls [Player.calculateScore]
  void dealCard() {
    final randomCard = createRandomCard();
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
