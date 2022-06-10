import 'package:flutter_test/flutter_test.dart';

import 'package:playing_cards/playing_cards.dart';

import '../../lib/models/player.dart';

void main() {
  group('Ace Calculation', (() {
    test('Ace and 10 Card should equal 21', () {
      final player = Player(name: "Player");

      player.cards.add(PlayingCard(Suit.clubs, CardValue.ace));
      player.calculateScore();
      expect(player.score, 11);
      player.cards.add(PlayingCard(Suit.clubs, CardValue.jack));
      player.calculateScore();
      expect(player.score, 21);
    });

    test('2 Aces and 9 should equal 21', () {
      final player = Player(name: "Player");

      player.cards.add(PlayingCard(Suit.clubs, CardValue.ace));
      player.calculateScore();
      expect(player.score, 11);

      player.cards.add(PlayingCard(Suit.clubs, CardValue.nine));
      player.calculateScore();
      expect(player.score, 20);

      player.cards.add(PlayingCard(Suit.clubs, CardValue.ace));
      player.calculateScore();
      expect(player.score, 21);
    });

    test('3 Aces should equal 13', () {
      final player = Player(name: "Player");

      player.cards.add(PlayingCard(Suit.clubs, CardValue.ace));
      player.calculateScore();
      expect(player.score, 11);

      player.cards.add(PlayingCard(Suit.clubs, CardValue.ace));
      player.calculateScore();
      expect(player.score, 12);

      player.cards.add(PlayingCard(Suit.clubs, CardValue.ace));
      player.calculateScore();
      expect(player.score, 13);
    });

    test('6 Ace and 10 should equal 17', () {
      final player = Player(name: "Player");

      player.cards.add(PlayingCard(Suit.clubs, CardValue.six));
      player.calculateScore();
      expect(player.score, 6);

      player.cards.add(PlayingCard(Suit.clubs, CardValue.ace));
      player.calculateScore();
      expect(player.score, 17);

      player.cards.add(PlayingCard(Suit.clubs, CardValue.ten));
      player.calculateScore();
      expect(player.score, 17);
    });
  }));
}
