import 'package:playing_cards/playing_cards.dart';

///Returns the numeric value of the [Type]
extension ValueExtension on CardValue {
  int get numValue {
    switch (this) {
      case CardValue.two:
        return 2;
      case CardValue.three:
        return 3;
      case CardValue.four:
        return 4;
      case CardValue.five:
        return 5;
      case CardValue.six:
        return 6;
      case CardValue.seven:
        return 7;
      case CardValue.eight:
        return 8;
      case CardValue.nine:
        return 9;
      case CardValue.ten:
        return 10;
      case CardValue.jack:
        return 10;
      case CardValue.queen:
        return 10;
      case CardValue.king:
        return 10;
      case CardValue.ace:
        return 1;
      default:
        return 1;
    }
  }
}

extension CardPrinting on PlayingCard {
  String print() {
    final value = this.value.toString().split('.').last;
    final suit = this.suit.toString().split('.').last;
    return "$value of $suit";
  }
}
