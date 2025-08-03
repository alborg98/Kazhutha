import 'card_model.dart';

class Deck {
  final List<CardModel> cards = [];

  Deck() {
    final suits = ['♠️', '♥️', '♦️', '♣️'];
    final ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];

    for (var suit in suits) {
      for (var rank in ranks) {
        cards.add(CardModel(rank: rank, suit: suit));
      }
    }

    cards.shuffle();
  }

  List<CardModel> deal(int count) {
    final hand = cards.take(count).toList();
    cards.removeRange(0, count);
    return hand;
  }
}
