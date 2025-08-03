class CardModel {
  final String rank; // A, 2, ..., K
  final String suit; // ♠️ ♥️ ♦️ ♣️

  CardModel({required this.rank, required this.suit});

  @override
  String toString() => '$rank$suit';
}
