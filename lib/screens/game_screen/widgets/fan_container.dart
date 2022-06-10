import 'package:flutter/material.dart';

import 'package:playing_cards/playing_cards.dart';

import 'card_fan.dart';

class FanContainer extends StatelessWidget {
  final List<PlayingCard> cards;
  const FanContainer({
    Key? key,
    required this.cards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 150,
      width: 200,
      child: CardFan(
        children: [
          for (var card in cards) PlayingCardView(card: card),
        ],
      ),
    );
  }
}
