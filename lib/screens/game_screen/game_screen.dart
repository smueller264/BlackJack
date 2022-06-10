import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'provider/game_provider.dart';
import 'widgets/fan_container.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  static const String routeName = "GameScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Dealer Score: ${context.watch<GameProvider>().dealer.score.toString()}",
                    ),
                  ),
                ),
                FanContainer(
                  cards: context.watch<GameProvider>().dealer.cards,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: context.read<GameProvider>().dealCard,
                  child: const Text("Hit"),
                ),
                TextButton(
                  onPressed: context.read<GameProvider>().stand,
                  child: const Text("Stand"),
                ),
                TextButton(
                  onPressed: context.read<GameProvider>().resetGame,
                  child: const Text("Reset Game"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                FanContainer(
                  cards: context.watch<GameProvider>().player.cards,
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Player Score: ${context.watch<GameProvider>().player.score}",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
