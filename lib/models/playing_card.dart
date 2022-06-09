import 'package:playing_cards/src/model/playing-card.dart';
import 'package:playing_cards/playing_cards.dart';

///Basic Class representing a playing card
///
///Contains all needed information about a playing card inclung [suit], [rank] and if
///it is a face card the [image]

// class PlayingCardModel extends PlayingCard {
//   late Type type;
//   bool faceUp;

//   PlayingCardModel(Suit suit, CardValue cardValue, )

  // Map<String, dynamic> toJson() {
  //   return {
  //     "suit": suit.name,
  //     "type": type.name,
  //     "faceUp": faceUp.toString(),
  //   };
  // }

  // ///Returns a random [PlayingCardModel]
  // PlayingCardModel.random({this.faceUp = true}) {
  //   List types = (List.from(Type.values))..shuffle();
  //   type = types.first;

  //   List suits = (List.from(Suit.values))..shuffle();
  //   suit = suits.first;
  // }

  // @override
  // String toString() {
  //   final type = this.type.toString().split('.').last;
  //   final suit = this.suit.toString().split('.').last;
  //   return "$type of $suit";
  // }

  // String getImageString() {
  //   int cardValue = type.value;
  //   String imageString = "";
  //   if (cardValue == 1) {
  //     imageString = "assets/images/cards/ace_of_${suit.name}.svg";
  //   } else {
  //     imageString =
  //         "assets/images/cards/${type.value.toString()}_of_${suit.name}.svg";
  //   }

  //   return imageString;
  // }
// }

// enum Suit {
//   hearts,
//   diamonds,
//   spades,
//   clubs,
// }

///Type of the Playing card going from two to ace
// enum Type {
//   two,
//   three,
//   four,
//   five,
//   six,
//   seven,
//   eight,
//   nine,
//   ten,
//   jack,
//   queen,
//   king,
//   ace,
// }

///Returns the numeric value of the [Type]
// extension ValueExtension on Type {
//   int get value {
//     switch (this) {
//       case Type.two:
//         return 2;
//       case Type.three:
//         return 3;
//       case Type.four:
//         return 4;
//       case Type.five:
//         return 5;
//       case Type.six:
//         return 6;
//       case Type.seven:
//         return 7;
//       case Type.eight:
//         return 8;
//       case Type.nine:
//         return 9;
//       case Type.ten:
//         return 10;
//       case Type.jack:
//         return 10;
//       case Type.queen:
//         return 10;
//       case Type.king:
//         return 10;
//       case Type.ace:
//         return 1;
//     }
//   }
// }
