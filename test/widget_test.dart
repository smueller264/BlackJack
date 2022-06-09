// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:blackjack/main.dart';

import '../lib/models/playing_card.dart';
import '../lib/screens/game_screen/game_screen.dart';
import '../lib/screens/game_screen/provider/game_provider.dart';

void main() {
  testWidgets('Playing Cards get the right picture',
      (WidgetTester tester) async {
    final gameProvider = GameProvider();

    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider.value(
        value: gameProvider,
        child: const GameScreen(),
      ),
    ));

    final ListView playerList =
        tester.widget(find.byKey(const Key("PlayerCards")));

    gameProvider.player.cards.clear();

    //Create every single card
    for (var type in Type.values) {
      for (var suit in Suit.values) {
        gameProvider.player.cards.add(PlayingCard(suit: suit, type: type));
      }
    }

    gameProvider.dealer.cards.clear();

    gameProvider.notifyListeners();

    expect(gameProvider.player.cards.length, 52);
    expect(gameProvider.dealer.cards.length, 0);

    final List<Widget> cards =
        tester.widgetList(find.byType(SvgPicture)).toList();
    expect(cards.length, 52);

    for (var card in gameProvider.player.cards) {
      final cardWidget = find.byWidget(SvgPicture.asset(card.getImageString()));
      expect(cardWidget, findsOneWidget);
    }
  });
}
