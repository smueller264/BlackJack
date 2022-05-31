import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

///Holds the State of the BlackJack game and cointains the game logic
class GameProvider extends ChangeNotifier {
  int playerScore = 0;
  int dealerScore = 0;
}
