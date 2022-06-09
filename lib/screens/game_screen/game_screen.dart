import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'provider/game_provider.dart';

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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Dealer Score: ${context.watch<GameProvider>().dealer.score.toString()}",
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        context.watch<GameProvider>().dealer.cards.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 75,
                        width: 75,
                        padding: const EdgeInsets.all(5),
                        child: SvgPicture.asset(context
                            .watch<GameProvider>()
                            .dealer
                            .cards[index]
                            .getImageString()),
                      );
                    },
                  ),
                ),
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: ListView.builder(
                    key: const Key("PlayerCards"),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        context.watch<GameProvider>().player.cards.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 75,
                        width: 75,
                        padding: const EdgeInsets.all(5),
                        child: SvgPicture.asset(context
                            .watch<GameProvider>()
                            .player
                            .cards[index]
                            .getImageString()),
                      );
                    },
                  ),
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
