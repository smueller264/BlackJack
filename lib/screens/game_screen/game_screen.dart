import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './game_provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  static const String routeName = "GameScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.watch<GameProvider>().playerScore.toString()),
      ),
    );
  }
}
