import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:playing_cards/playing_cards.dart';

import 'provider/game_provider.dart';
import '../../constants/frontend/playing_card_style.dart';
import 'widgets/CardFan.dart';

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
                        height: 1000,
                        padding: const EdgeInsets.all(5),
                        child: PlayingCardView(
                          elevation: 3.0,
                          card:
                              context.watch<GameProvider>().dealer.cards[index],
                        ),
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
              children: [
                Container(
                  height: 150,
                  width: 300,
                  child: CardFan(children: [
                    for (var card in context.watch<GameProvider>().player.cards)
                      PlayingCardView(card: card)
                  ]),
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
