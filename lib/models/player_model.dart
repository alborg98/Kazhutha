import 'card_model.dart';

enum PlayerPosition { top, bottom, left, right }

class Player {
  final String name;
  List<CardModel> hand = [];

  Player(this.name);
}
