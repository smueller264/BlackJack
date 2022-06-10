import 'package:flutter/material.dart';

import 'dart:developer' as developer;

import 'package:playing_cards/playing_cards.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../extensions/playing_card_extension.dart';

class CardFan extends StatelessWidget {
  /// Children of the flat fan. Will be arrayed evenly (and potentially stacked) across the width.
  /// Renders from first to last, so the last child will be on top.
  final List<PlayingCardView> children;

  /// Creates a flat card fan.
  const CardFan({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(Object context) => Stack(
        children: List.generate(children.length, (index) {
          return AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            alignment:
                Alignment(-1.0 + (index / (children.length - 1)) * 2.0, 0),
            child: children[index],
          );
        }),
      );
}
