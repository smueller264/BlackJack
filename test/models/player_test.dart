import 'package:flutter_test/flutter_test.dart';

import '../../lib/models/player.dart';
import '../../lib/models/playing_card.dart';
import '../../lib/screens/game_screen/provider/game_provider.dart';

void main() {
  group('Ace Calculation', (() {
    test('Ace and 10 Card should set player score to 21', () {
      final player = Player(name: "Player");

      player.cards.add(PlayingCard(suit: Suit.clubs, type: Type.ace));
      player.calculateScore();
      expect(player.score, 11);
      player.cards.add(PlayingCard(suit: Suit.clubs, type: Type.jack));
      player.calculateScore();
      expect(player.score, 21);
    });

    test('2 Aces and 9 should equal 21', () {
      final player = Player(name: "Player");

      player.cards.add(PlayingCard(suit: Suit.clubs, type: Type.ace));
      player.calculateScore();
      expect(player.score, 11);
      player.cards.add(PlayingCard(suit: Suit.clubs, type: Type.nine));
      expect(player.score, 20);
      player.cards.add(PlayingCard(suit: Suit.clubs, type: Type.ace));
      expect(player.score, 21);
    });
  }));
}
