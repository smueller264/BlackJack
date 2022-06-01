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
            child: Center(
              child: Text(
                context.watch<GameProvider>().player.score.toString(),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: context.watch<GameProvider>().gameActive
                      ? context.read<GameProvider>().dealCard
                      : null,
                  child: const Text("Hit"),
                ),
                TextButton(
                  onPressed: context.watch<GameProvider>().gameActive
                      ? null
                      : context.read<GameProvider>().resetGame,
                  child: const Text("Reset Game"),
                ),
                TextButton(
                  onPressed: context.read<GameProvider>().stand,
                  child: const Text("Stand"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                context.watch<GameProvider>().dealer.score.toString(),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(context.watch<GameProvider>().winnner),
            ),
          ),
          Expanded(
            child: Center(
                child:
                    SvgPicture.asset("assets/images/cards/king_of_clubs2.svg")),
          ),
        ],
      ),
    );
  }
}
